import cPickle as pick
from numpy import zeros, interp, array

class element(object):
    '''
    This class will hold information relevant to a fuel rod
    '''
    def __init__(self, line):
        self.location, self.ID, self.folder, self.burnup = line
        try:
            self.folder = int(self.folder)
        except ValueError:
            pass
        letter = {'A':1, 'B':2, 'C':3, 'D':4, 'E':5, 'F':6}
        self.number = 100 * letter[self.location[0]] + int(self.location[1:])
        self.material = {}
        self.density = []
        
    def __str__(self):
        return '{} {} {}'.format(self.location, self.ID, self.material.keys())
    
        
class makeFuelData(object):
    def __init__(self, fileName):
        self.nAxialDiv = 1
        self.getFuelData()
        self.fuelArray(fileName)
        self.writeFuelMats()
        
    def __str__(self):
        s = ''
        for e in self.elements:
            s += e.__str__() + '\n'
        return s[:-1]
        
    def getFuelData(self):
        self.fuelData = {}
        for i in [1, 2, 4, 5, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]:
            self.fuelData[i] = pick.load(open('{}.p'.format(i if i != 5 else 16), 'rb')) 
        
    def fuelArray(self, fileName):
        '''
        This will gather the fuel information from which to create the MCNP file
        '''
        # initialize a list to hold fuel information
        self.elements = []
        # Use an entered file's data
        assert fileName is not None, "Enter the fuel configuration filename"
        f = open(fileName, 'r').readlines()
        # Initialize fuel element counter
        self.nFuelElements = 0
        # Iterate over lines in the file
        for line in f[1:]:
            # split line into elements
            l = line.split()
            # if line is empty, skip
            if len(l) == 0: 
                continue
            # if line is a control rod that uses a two-word name, combine name
            if len(l) == 9:
                l[1:3] = [''.join((l[1], ' ', l[2]))]
            # Iterate through elements, convert numbers into floats
            for i, e in enumerate(l):
                if i > 1:
                    try:  # Convert numbers into floats if possible
                        l[i] = float(e)
                    except ValueError:  # Don't worry about converting 'NA'
                        pass
            if type(l[2]) != str:  # increment counter if fuel element
                self.nFuelElements += 1
            # Put information into container class, then append to list
            self.elements.append(element(l))
            
    def writeFuelMats(self):
        for e in self.elements:
            if e.burnup != 'NA':
                for i in range(self.nAxialDiv):
                    D = self.burn(e.burnup, abs(3 - i) + 1 if i < 6 else 4, e.folder) 
                    e.density.append(D['density'])
                    del D['density']
                    e.material[i] = D 
                
            
    def burn(self, x, n, folder, ZN=1.7):
        assert 1 <= n <= 4, ""
        V = self.fuelData[folder]['fuel{}'.format(n)]['VOLUME'] / (1.0 if n == 1 else 2.0)
        B = self.fuelData[folder]['tot']['BURNUP']
        M = self.fuelData[folder]['fuel{}'.format(n)]['MDENS']
        total = 0.0
        frac = {}
        den = zeros(V.shape)
        for key, N in self.fuelData[folder]['fuel{}'.format(n)]['MDENS'].items():
            if N.shape == V.shape:
                den += M[key]
                frac[key] = N * V
                total += frac[key]
                        
        T = 1.0
        data = {}
        data['density'] = interp(x, B, den)
                
        for key, f in frac.items():
            frac[key] = f / total
            if key not in ['total', 'lostdata']:
                data[key] = interp(x, B, frac[key])
                T -= data[key]    
        data['H'] = T * (ZN / (ZN * 1.0078250321 + 89.9047037))
        data['Zn'] = T - data['H']
        return data

class controlRods(object):
    '''
    This class computes the heights for the MCNP writer for each control rod
    The imputs represent the percent of the rod that is removed from the core
    i.e., 0 is a completely inserted rod and 100 is completely removed
    
    If the flag worthWeighted is True, the inputs are the percent of the worth removed from the core
    if the flag is false, the imputs are the percent of the length of the rod removed from the core
    
    the heights for the MCNP writer are stored as:
        shimHeight, regHeight, pulseHeight, safetyHeight 
    '''
    def __init__(self, reg=100, shim=100, pulse=100, safety=100, worthWeighted=False):
        self.reg = reg
        self.shim = shim
        self.pulse = pulse
        self.safety = safety
        if worthWeighted:
            self.getWeightedHeight()
        else:
            self.getLinearHeight()
            
    def __str__(self):
        s = 'Shim Rod Height = {}\n'.format(self.shimHeight)
        s += 'Reg Rod Height = {}\n'.format(self.regHeight)
        s += 'Pulse Rod Height = {}\n'.format(self.pulseHeight)
        s += 'Safety Rod Height = {}'.format(self.safetyHeight)
        return s
        
    def getLinearHeight(self):
        self.shimHeight = self.shim * 0.4318
        self.regHeight = self.reg * 0.4191
        self.pulseHeight = self.pulse * 0.3937
        self.safetyHeight = self.safety * 0.3302
        
        
    def getWeightedHeight(self):
        shimCoef = array([-1.365833e-17, 5.334e-14, -8.01e-11, 5.38e-8, -1.357e-5, 2.421e-3, -1.527073e-1])
        regCoef = array([-2.944876e-32, 1.376e-15, -3.0175e-12, 7.103333e-10, 1.2755e-6, 5.959e-4, -7.276734e-2])
        pulseCoef = array([1.905e-17, -5.512e-14, 5.82e-11, -3.236e-8, 1.33e-5, -3.292e-4, -7.30073e-2])
        safetyCoef = array([-3.22e-18, 1.5302e-14, -2.6175e-11, 1.779e-8, -3.6935e-6, 1.836e-3, -1.61987e-1])
        
        self.shimHeight = self.getH(shimCoef, self.shim) * 0.4318
        self.regHeight = self.getH(regCoef, self.reg) * 0.4191
        self.pulseHeight = self.getH(pulseCoef, self.pulse) * 0.3937
        self.safetyHeight = self.getH(safetyCoef, self.safety) * 0.3302
        
    def getH(self, coef, x):
        Hmin = 0
        Hmax = 100
        rhoMax = self.fit(Hmax, coef)
        if 100 > x > 0:
            while True:
                H = 0.5 * (Hmin + Hmax)
                rho = self.fit(H, coef)
                if abs(rho / rhoMax * 100 - x) <= 1e-6:
                    break
                elif rho / rhoMax * 100 > x:
                    Hmax = H
                else:
                    Hmin = H
        else:
            H = Hmin if x == 0 else Hmax
        return H
        
    def fit(self, x, coefs):
        return sum(array([(100 + 10 * x) ** i for i in range(0,7)[::-1]]) * coefs)
            
if __name__ == '__main__':
    data = makeFuelData('currentConfig.txt')
    cntl = controlRods(reg=40, shim=50, pulse=100, safety=10, worthWeighted=False)
    print cntl
#     print getFuelData()
