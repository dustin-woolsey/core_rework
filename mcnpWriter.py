from numpy import sin, cos, linspace, array, pi
from materialWriter import makeFuelData, controlRods

class writer(object):
    def __init__(self, nAxialDiv=1, nRadialDiv=1, data=None, cntl=None, outname=None):
        # Create elements array
        assert data is not None, 'Provide fuel composition data'
        self.elements = data.elements
        self.nFuelElements = data.nFuelElements
        
        # Save control rod data
        if cntl is None:
            # set default condition
            self.controlRods = controlRods(reg=0, shim=0, pulse=0, safety=0)
        else:
            self.controlRods = cntl
        
        # Record number of axial/radial segments
        assert 1 <= nAxialDiv <= 10, 'Axial segments must be between 1 and 10'
        self.nAxialDiv = nAxialDiv
        assert 1 <= nRadialDiv <= 10, 'Radial segments must be between 1 and 10'
        self.nRadialDiv = nRadialDiv
        
        # Radii of each fuel ring
        radii = array([0.00000, 4.05384, 7.98068, 11.94562, 15.91564, 19.88820])
        
        # Possible angles given number of fuel elements
        def getAngles(l): 
            return linspace(0, 2 * pi, (1 if l == 0 else 6 * l), endpoint=False)
        
        # Compute list of coordinates for fuel pin centers
        self.coord = ['({:.6f},{:.6f})'.format(radii[l] * sin(t), radii[l] * cos(t)) for l in range(len(radii)) for t in getAngles(l)]
        
        # Create the file
        self.makeFile(outname)

    def getVolumes(self):
        self.V = [0.0, 0.0, 23186.1, 7981.87, 0.0, 0.0, 0.0, 0.0, 119806.0, 2876.05,
                  23.606, 0.0, 0.0, 0.0, 27.2206, 263.299, 0.0, 0.0, 0.0, 292.266,
                  0.0, 0.0, 0.0, 37.203, 360.755, 0.0, 0.0, 0.0, 23.4395, 153.542, 0.0, 0.0]
        
        zmin = -19.05
        zmax = 19.05
        rmin = 0.2285
        rmax = 1.8161
        
        R = linspace(rmin, rmax, self.nRadialDiv + 1)
        Z = linspace(zmin, zmax, self.nAxialDiv + 1)
        
        for e in range(self.nFuelElements):
            self.V += [0.0, 0.0, 0.0, 90.5361, 0.0, 6.24953, 90.5361, 26.3186, 0.0, 0.0, 0.0]
            for j in range(self.nAxialDiv):
                for i in range(self.nRadialDiv):
                    self.V.append(pi * (R[i + 1] ** 2 - R[i] ** 2) * (Z[j + 1] - Z[j]))
                    
        self.V += [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 602.17, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 18.099, 4.87847, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        
    def getFuelCells(self):
        s = ''
        self.fuelID = []
        flag = True
        half = self.nAxialDiv / 2

        for e in self.elements:
            ID = e.number * 1000
            matID = e.number * 10 + 1 + half
            rho = e.density
            if e.burnup != 'NA':
                if flag:
                    rings = [200] + [2021 + i for i in range(self.nRadialDiv - 1)] + [202]
                    
                    flag = False
                    s += 'c ******************************************************************************\n'
                    s += 'c ** FUEL UNIVERSES: Individual FE\'s modeled for burnup as of 3-31-10\n'
                    s += 'c ==============================================================================\n'
                    s += '  {}   6   -1 -21 201                  u={}   $ Water around lower pin\n'.format(ID, e.number)
                    s += '  {}   9   -7.9 -21 -201               u={}   $ Bottom pin\n'.format(ID + 1, e.number)
                    s += '  {}   9   -7.9 -14 21                 u={}   $ BOTTOM SS cap\n'.format(ID + 2, e.number)
                    s += '  {}   2   -1.6 14 -13 -202            u={}   $ BOTTOM Axial reflector\n'.format(ID + 3, e.number)
                    s += '  {}   9   -7.9 14 -4 202              u={}   $ Cladding\n'.format(ID + 4, e.number)
                    s += '  {}   8   -6.5 13 -10 -200            u={}   $ Zirc FILLER\n'.format(ID + 5, e.number)
                    s += '  {}   2   -1.6 10 -6 -202             u={}   $ TOP Axial reflector\n'.format(ID + 6, e.number)
                    s += '  {}   3   -0.001239 6 -4 -202         u={}   $ Air gap\n'.format(ID + 7, e.number)
                    s += '  {}   9   -7.9 4 -3                   u={}   $ TOP SS cap\n'.format(ID + 8, e.number)
                    s += '  {}   9   -7.9 3 -201                 u={}   $ Upper pin\n'.format(ID + 9, e.number)
                    s += '  {}   6   -1 3 201                    u={}   $ Water around pin\n'.format(ID + 10, e.number)
                    ID += 100
                    for i in range(self.nAxialDiv):
                        for j in range(self.nRadialDiv):
                            s += '  {}  {}  -{:.3f} {: <3d} -{: <3d} {: <4d} -{: <4d} u={}   $ ELEMENT {}-{}.{}-{}  S/N:{}\n'.format(ID + 10 * i + j, matID - abs(half - i), rho[i], self.fuelPlaneID[i + 1], self.fuelPlaneID[i], rings[j], rings[j + 1], e.number, e.location[0], e.location[1:], i + 1, j + 1, e.ID)
                            self.fuelID.append(ID + 10 * i + j)
                    IDb = ID
                else:
                    s += 'c ==============================================================================\n'
                    s += '  {} like {} but u={}\n'.format(ID, IDb - 100, e.number)
                    s += '  {} like {} but u={}\n'.format(ID + 1, IDb - 99, e.number)
                    s += '  {} like {} but u={}\n'.format(ID + 2, IDb - 98, e.number)
                    s += '  {} like {} but u={}\n'.format(ID + 3, IDb - 97, e.number)
                    s += '  {} like {} but u={}\n'.format(ID + 4, IDb - 96, e.number)
                    s += '  {} like {} but u={}\n'.format(ID + 5, IDb - 95, e.number)
                    s += '  {} like {} but u={}\n'.format(ID + 6, IDb - 94, e.number)
                    s += '  {} like {} but u={}\n'.format(ID + 7, IDb - 93, e.number)
                    s += '  {} like {} but u={}\n'.format(ID + 8, IDb - 92, e.number)
                    s += '  {} like {} but u={}\n'.format(ID + 9, IDb - 91, e.number)
                    s += '  {} like {} but u={}\n'.format(ID + 10, IDb - 90, e.number)
                    ID += 100
                    for i in range(self.nAxialDiv):
                        for j in range(self.nRadialDiv):
                            s += '  {} like {} but mat={} rho=-{:.3f} u={}  $ ELEMENT {}-{}.{}-{}  S/N:{}\n'.format(ID + 10 * i + j, IDb + 10 * i + j, matID - abs(half - i), rho[i], e.number, e.location[0], e.location[1:], i + 1, j + 1, e.ID)
                            self.fuelID.append(ID + 10 * i + j)
        return s

    def getCells(self):
        s = ''
        s += 'c CELLS:\n'
        s += '    1     0         1 :-20 :38  $ OUTSIDE\n'
        s += '    2     6      -1 (((-1 2 -38 ):(-2 7 -38 44 ): $ POOL ELEMENTS\n'
        s += '            (-17 18 -38 30 ):(-18 20 -38 ):(-7 17 -38 37 )):\n'
        s += '            (-15 18 -38 43 ))#7 #8\n'
        s += '    3     6      -1 -34 33 -7 11  $ RSR SPACE/VOLUME\n'
        s += '    4     7  -2.699 -35 32 -9 12 #3  $ RSR WALLS\n'
        s += '    5     2    -1.6 -36 31 -9 16 #3 #4 #7 #8  $ REFLECTOR GRAPHITE\n'
        s += '    6     7  -2.699 -37 30 -7 17 #3 #4 #5 #7 #8  $ CANNISTER/WALLS\n'
        s += '    7     7  -2.699 31 -40 90 -38 26  $ NEBP AL CASE\n'
        s += '    8     3 -0.001239 31 -90 -38 26  $ NEBP CAVITY\n'
        s += '    9     0         (-30 -7 15 ):(-44 -2 7 ) fill=7 $ CORE SPACE\n'
        s += '   10     7  -2.699 -15 18 -43 203  $ Lower grid plate\n'
        s += '   11     0         -15 18 -203  fill=4 $ CT penetration, lower grid plate\n'
        s += 'c ** UNIVERSES\n'
        s += 'c ******************************************************************************\n'
        s += 'c ** WATER IN CORE AREA: UNIVERSE = [8]\n'
        s += '   95     6   -1         20              u=8  $ Water above pool bottom\n'
        s += '   96     7   -2.699    -20              u=8  $ Stuff below pool bottom\n'
        s += 'c ** CONTROL ROD UNIVERSES\n'
        s += 'c ** NOTE: Holes in guide tubes modeled as reduced Al density\n'
        s += 'c    (101, 110, 120, 126)\n'
        s += 'c ** PULSE ROD: UNIVERSE = [21]\n'
        s += '  101     7  -2.12  210                  u=21 $ Guide Tube\n'
        s += '  102     7  -2.699 50 -68 213 -214      u=21 $ Rod cladding\n'
        s += '  103    11  -2.0   50 -68 -213          u=21 $ Pulse rod\n'
        s += '  104     9  -7.9   68 -217 218          u=21 $ SS extension\n'
        s += '  105     6  -1    -210 #102 #103 #104   u=21 $ Water\n'
        s += 'c ** SAFETY ROD: UNIVERSE = [22]\n'
        s += '  110     7  -2.12  210                  u=22 $ Guide Tube\n'
        s += '  111    13  -2.52  51 -68 -212          u=22 $ Safety rod\n'
        s += '  112     9  -7.9   68 -217 218          u=22 $ SS extension\n'
        s += '  113     6  -1    -210 #111 #112        u=22 $ Water\n'
        s += 'c ** SHIM ROD: UNIVERSE = [23]\n'
        s += '  120     7  -2.12  210                  u=23 $ Guide Tube\n'
        s += '  121     7  -2.699 52 -68 211 -212      u=23 $ Rod cladding\n'
        s += '  122    12  -2.48  52 -68 -211          u=23 $ Shim/safety rod\n'
        s += '  123     9  -7.9   68 -217 218          u=23 $ SS extension\n'
        s += '  124     6  -1   -210 #121 #122 #123    u=23 $ Water\n'
        s += 'c ** REGULATING ROD: UNIVERSE = [24]\n'
        s += '  126     7  -2.12 219                   u=24 $ Guide Tube\n'
        s += '  127     7  -2.699 53 -68  215 -216     u=24 $ Rod cladding\n'
        s += '  128    12  -2.48  53 -68 -215          u=24 $ Regulating rod\n'
        s += '  129     9  -7.9   68 218 -217          u=24 $ SS extension\n'
        s += '  130     6  -1    -219 #127 #128 #129   u=24 $ Water\n'
        l = self.getFuelCells()
        s += l
        s += 'c ==============================================================================\n'
        s += 'c ** RABBIT: UNIVERSE = [2]\n'
        s += '  145     7  -2.699   (25 -12):(12 219):(-25 -45) u=2 $ Not tube\n'
        s += '  146     3  -0.001239 12 -219                    u=2 $ air\n'
        s += '  147     6  -1        #145 #146                  u=2 $water\n'
        s += 'c ** GRAPHITE ROD: UNIVERSE = [3]\n'
        s += '  160     6      -1 -21 201              u=3 $ Water around lower pin\n'
        s += '  161     9    -7.9 -21 -201             u=3 $ Bottom pin\n'
        s += '  162     9    -7.9 -14 21               u=3 $ BOTTOM SS cap\n'
        s += '  163     9    -7.9 14 -4 202            u=3 $ Cladding\n'
        s += '  164     2    -1.6 14 -4 -202           u=3 $ GRAPHITE\n'
        s += '  165     9    -7.9 4 -3                 u=3 $ TOP SS cap\n'
        s += '  166     9    -7.9 3 -201               u=3 $ Upper pin\n'
        s += '  167     6      -1 3 201                u=3 $ Water around pin\n'
        s += 'c ** CENTRAL THIMBLE: UNIVERSE = [4]\n'
        s += '  170     6      -1 12 -202              u=4 $ Water over midplane\n'
        s += '  171     7  -2.699 -12 :202             u=4 $ Below centerline\n'
        s += 'c ** SOURCE: UNIVERSE = [5]\n'
        s += '  175     7  -2.699 -233 :230 :232       u=5 $ SOURCE HOLDER\n'
        s += '  176     9 -0.394473 233 -234 -231      u=5 $ SOURCE, SS SHELL\n'
        s += '  177     3 -0.001239 -232 233 -230 #176 u=5 $ SOURCE CAVITY\n'
        s += 'c ** THIMBLE: UNIVERSE = [6]\n'
        s += '  180     6      -1 -21 201              u=6 $ Water around lower pin\n'
        s += '  181     7  -2.699 -21 -201             u=6 $ Bottom pin\n'
        s += '  182     7  -2.699 21 -14               u=6 $ BOTTOM cap\n'
        s += '  183     7  -2.699 14 210               u=6 $ Thimble TUBE\n'
        s += '  184     6      -1 14 -210              u=6 $ Thimble Water\n'
        s += 'c ** CORE & FUEL: UNIVERSE = [7]\n'
        s += 'c ** WATER AROUND UPPER PINS & GRID PLATE ***********************************\n'
        s += '  185     6      -1 -1 5 1201 1202 1203 1204 1205 1206 1301 1302 1303 $ H20\n'
        s += '             1304 1305 1306 1307 1308 1309 1310 1311 1312 1401 1402 1403 1404\n'
        s += '             1405 1406 1407 1408 1409 1410 1411 1412 1413 1414 1415 1416 1417\n'
        s += '             1418 1501 1502 1503 1504 1505 1506 1507 1508 1509 1510 1511 1512\n'
        s += '             1513 1514 1515 1516 1517 1518 1519 1520 1521 1522 1523 1524 1601\n'
        s += '             1602 1603 1604 1605 1606 1607 1608 1609 1610 1611 1612 1613 1614\n'
        s += '             1615 1616 1617 1618 1619 1620 1621 1622 1623 1624 1625 1626 1627\n'
        s += '             1628 1629 1630 203                                      u=7\n'
        s += 'c ** UPPER GRID PLATE *******************************************************\n'
        s += '  186     7  -2.699 -5 8 1201 1202 1203 1204 1205 1206 1301 $ U17ER GRID PLAT\n'
        s += '             1302 1303 1304 1305 1306 1307 1308 1309 1310 1311 1312 1401 1402\n'
        s += '             1403 1404 1405 1406 1407 1408 1409 1410 1411 1412 1413 1414 1415\n'
        s += '             1416 1417 1418 1501 1502 1503 1504 1505 1506 1507 1508 1509 1510\n'
        s += '             1511 1512 1513 1514 1515 1516 1517 1518 1519 1520 1521 1522 1523\n'
        s += '             1524 1601 1602 1603 1604 1605 1606 1607 1608 1609 1610 1611 1612\n'
        s += '             1613 1614 1615 1616 1617 1618 1619 1620 1621 1622 1623 1624 1625\n'
        s += '             1626 1627 1628 1629 1630 203                            u=7\n'
        s += 'c ** CORE WATER *************************************************************\n'
        s += '  187     6      -1 -8 1201 1202 1203 1204 1205 1206 1301 1302 1303 $ CORE H2O\n'
        s += '             1304 1305 1306 1307 1308 1309 1310 1311 1312 1401 1402 1403 1404\n'
        s += '             1405 1406 1407 1408 1409 1410 1411 1412 1413 1414 1415 1416 1417\n'
        s += '             1418 1501 1502 1503 1504 1505 1506 1507 1508 1509 1510 1511 1512\n'
        s += '             1513 1514 1515 1516 1517 1518 1519 1520 1521 1522 1523 1524 1601\n'
        s += '             1602 1603 1604 1605 1606 1607 1608 1609 1610 1611 1612 1613 1614\n'
        s += '             1615 1616 1617 1618 1619 1620 1621 1622 1623 1624 1625 1626 1627\n'
        s += '             1628 1629 1630 203                                      u=7\n'
        s += self.getFuelLocation()
        return s
    
    def writeLocation(self, element):
        ring = element.number // 100 - 1
        location = int(element.location[1:])
        nums = [1, 6, 12, 18, 24, 30]
        s = self.coord[sum(nums[:ring]) + location - 1]
        x, y = [float(i) for i in s[1:-1].split(',')]
        loc = element.number
        if 'thimble' in element.ID.lower():
            fill = 4
            height = 0
        elif 'pulse' in element.ID.lower():
            fill = 21
            height = self.controlRods.pulseHeight
        elif 'safety' in element.ID.lower():
            fill = 22
            height = self.controlRods.safetyHeight
        elif 'shim' in element.ID.lower():
            fill = 23
            height = self.controlRods.shimHeight
        elif 'reg' in element.ID.lower():
            fill = 24
            height = self.controlRods.regHeight
        elif 'source' in element.ID.lower():
            fill = 5
            height = 0
        elif 'graphite' in element.ID.lower():
            fill = 3
            height = 0
        elif 'rabbit' in element.ID.lower():
            fill = 2
            height = 0
        elif 'void' in element.ID.lower() or 'lido' in element.ID.lower():
            fill = 8
            height = 0
        else:
            fill = loc
            height = 0
        if loc == 101:
            return ' 1100     0         -203   fill={:<3d} ({: 10.6f} {: 10.6f} {: 4.2f})  u=7 $ {}\n'.format(fill, x, y, height, element.location)
        else:
            return '  {}     0         -1{}  fill={:<3d} ({: 10.6f} {: 10.6f} {: 4.2f})  u=7 $ {}\n'.format(loc, loc, fill, x, y, height, element.location)
    
    def getFuelLocation(self):
        s = ''
        s += 'c ** FUEL POSITIONS *********************************************************\n'
        for e in self.elements:
            s += self.writeLocation(e)
        return s
        
    def getSurfaces(self):
        s = ''
        s += 'c SURFACES\n'
        s += 'c ***  ELEVATIONS **************************************************************\n'
        s += '    1        pz 50  $ POOL SURFACE\n'
        s += '    2        pz 37.2618  $ TOP OF FUEL PINS\n'
        s += '    3        pz 33.782  $ Top of end cap\n'
        s += '    4        pz 30.3276  $ Top of gap/CLADDING\n'
        s += '    5        pz 33.79  $ Top of grid plate\n'
        s += '    6        pz 27.7876  $ Top of axial reflector\n'
        s += '    7        pz 27.94  $ REFLECTOR CANNISTER\n'
        s += '    8        pz 31.162  $ **** Bottom top grid\n'
        s += '    9        pz 26.035  $ RADIAL REFLECTOR TOP\n'
        s += '   10        pz 19.05  $ Top of fuel\n'
        s += '   11        pz 0.635  $ RSR FLOOR\n'
        s += '   12        pz 0  $ RSR SUBFLOOR -- LINE OF FUEL SYMMETRTY\n'
        s += '   13        pz -19.05  $ Bottom of fuel (38.1/2 cm)\n'
        s += 'c **  BEST ESTIMATE 3.74 in = 9.4996 cm {-19.05 cm -9.4996 cm}=>\n'
        s += '   14        pz -27.7876 $ Bottom of axial reflector/CLADDING\n'
        s += 'c **  APPROX CONE 3.797 cm base 3.797 cm heigth\n'
        s += '   21        pz -32      $ Bottom of plug/top of pin\n'
        s += '   15        pz -34.163  $ Top of bottom grid plate\n'
        s += '   16        pz -26.035  $ RADIAL REFLECTOR BOTTOM\n'
        s += '   17        pz -27.305  $ REFLECTOR CANNISTER BOTTOM\n'
        s += '   18        pz -36.07  $ Bottom of grid plate\n'
        s += '   20        pz -50  $ BOTTOM OF POOL\n'
        s += 'c *** OTHER PLANES *************************************************************\n'
        s += '   25        pz -5.0 $ Bottom of thick part of rabbit\n'
        s += '   26        px 0  $ CORE 1/2\n'
        for i, div in enumerate(self.fuelPlaneID[1:-1]):
            s += '  {}        pz {}  $ FUEL division\n'.format(div, self.fuelPlanes[i])
        s += 'c *** Z CYLINDERS **************************************************************\n'
        s += '   30        cz 22.85   $ CORE/REFLECTOR WALL\n'
        s += '   31        cz 23.485  $ INNER REFLECTOR\n'
        s += '   32        cz 33.02   $ RSR INNER WALL\n'
        s += '   33        cz 33.665  $ RSR INNER WALL\n'
        s += '   34        cz 37.465  $ RSR OUTER VOLUME\n'
        s += '   35        cz 38.1    $ RSR OUTER WALL\n'
        s += '   36        cz 53.35   $ OUTER REFLECTOR\n'
        s += '   37        cz 53.975  $ OUTER REFLECTOR WALL\n'
        s += '   38        cz 60      $ EDGE OF POOL\n'
        s += 'c *** OTHER CYLINDERS **********************************************************\n'
        s += '   40     1 c/x 0 -8.3 8.255  $ NE/SW BEAM PORT\n'
        s += '   90     1 c/x 0 -8.3 7.62   $ NE/SW BEAM PORT\n'
        s += '   43        cz 22            $ LOWER GRID PLATE RADIUS\n'
        s += '   44        cz 24.75         $ UPPER GRID PLATE RADIUS\n'
        s += '   45        cz 1.0           $ Bottom part of rabbit, above pin\n'
        s += 'c *** FLUX PROBE HOLES *********************************************************\n'
        s += '   50        pz -12.4373   $ Pulse rod, span 39.37 cm\n'
        s += '   51        pz -12.6811   $ Safety rod, span 33.02 cm\n'
        s += '   52        pz -26.0390   $ Shim rod, span 43.18\n'
        s += '   53        pz -21.3628   $ Regulating rod, span 41.91\n'
        s += '   68        pz 24.257\n'
        s += 'c ** UNIVERSE FUEL PIN cylinders ***********************************************\n'
        s += '  200        cz 0.2285   $ Zirc FILLer\n'
        s += '  201        cz 0.635    $ Pin diameter\n'
        s += '  202        cz 1.8161   $ Fuel diameter MARK III FUEL SCHEMATIC\n'
        L = linspace(0.2285, 1.8161, self.nRadialDiv + 1)[::-1][1:-1]
        for i, l in enumerate(L):
            s += '  {: <4d}       cz {:6.5f}  $ Fuel diameter MARK III FUEL SCHEMATIC\n'.format(2021 + i, l)
            
        s += '  203        cz 1.985    $ CT & RABBIT\n'
        s += 'c ** UNIVERSE CONTROL ROD cylinders ********************************************\n'
        s += '  210        cz 1.69165  $ Guide tube outer radius 1.89865 cm\n'
        s += '  219        cz 1.58815  $ REG guide tube surface\n'
        s += '  211        cz 1.511    $ Pulse meat\n'
        s += '  212        cz 1.587    $ Pulse rod cladding surface\n'
        s += '  213        cz 1.5113   $ Shim/safety meat\n'
        s += '  214        cz 1.5875   $ Shim/safety rod cladding surface\n'
        s += '  215        cz 1.03505  $ Rod reg meat\n'
        s += '  216        cz 1.11125  $ Reg rod cladding surface\n'
        s += '  217        cz 1.254    $ Extension tube outer radius\n'
        s += '  218        cz 0.619    $ Extesion tube inner radius\n'
        s += 'c ** UNIVERSE SOURCE ***********************************************************\n'
        s += '  230        cz 0.981  $ SOURCE HOLDER CAVITY\n'
        s += '  231        cz 0.9525  $ SOURCE RADIUS\n'
        s += 'c source elevations ALSO USES SOME FUEL ELEVATIONS\n'
        s += '  232        pz 3.8  $ Source cavity top\n'
        s += '  233        pz -3.8  $ Source cavity bottom\n'
        s += '  234        pz 2.55  $ Source heigth\n'
        s += 'c ******* END OF UNIVERSE SURFACE DEFINTIONS ***********************************\n'
        s += self.getRings()
        return s
        
    def getRings(self):
        R = 'ABCDEF'
        s = ''
        s += 'c ** A RING USES SURFACE 203 ***************************************************\n'
        s += 'c 1000      c/z 0 0 1.8669         $ A-1 = surface 203\n'
        for e in self.elements[1:]:
            ring = e.number // 100 - 1
            location = int(e.location[1:])
            nums = [1, 6, 12, 18, 24, 30]
            q = self.coord[sum(nums[:ring]) + location - 1]
            x, y = [float(i) for i in q[1:-1].split(',')]
            if location == 1:
                s += 'c ** {} Ring ********************************************************************\n'.format(R[ring])
            s += ' {}       c/z {: 10.6f} {: 10.6f} 1.8669      $ {}-{}\n'.format(1100 + 100 * ring + location, x, y, R[ring], location)
        
        return s
        
    def writeTally(self, fuelID):
        s = ''
        s += 'c ************************* TALLY SPECIFICATION ********************************\n'
        s += 'c Flux average tally for active fuel region of all 85 elements\n'
        s += 'c FUEL ELEMENT ORDER IMPORTANT\n'
        
        for j in ['f4:n  ', '\nf7:n  ']:
            s += j
            for i in range(len(fuelID)):
                s += str(fuelID[i]) + ' '
                if (i + 1) % 10 == 0 and i != len(fuelID) - 1:
                    s += '&\n      '
        return s    
        
    def writeFuelMats(self):
        elems = {'Sm':62, 'Gd':64, 'Eu':63, 'Nd':60, 'Am':95, 'Pu':94, 'Ru':44, 'U':92, 'Xe':54, 'H':1, 'Tc':43, 'Mo':42, 'Pm':61, 'Zr':40, 'Rh':45, 'Cs':55, 'Np':93}
        noBurnIsotopes = [92238, 1001, 92235, 40090]
        s = ''
        for e in self.elements:
            mat_ID = e.number * 10 + 1
            if e.burnup != 'NA':
                s += 'c **  {}-{}  Fuel ID= {}\n'.format(e.location[0], e.location[1:], e.ID)
                for i in range(self.nAxialDiv / 2 + 1):
                    D = e.material[i]
                    if e.burnup == 0:
                        s += 'm{} {}.71c -{}\n'.format(mat_ID + (i if i <= 3 else -i + 6), noBurnIsotopes[0], D['U238'])
                        s += '      {}.71c -{}\n'.format(noBurnIsotopes[1], D['H'])
                        s += '      {}.71c -{}\n'.format(noBurnIsotopes[2], D['U235'])
                        s += '      {}.71c -{}\n'.format(noBurnIsotopes[3], D['Zn'])                 
                    else:
                        s += 'm{} {}.71c -{}\n'.format(mat_ID + (i if i <= 3 else -i + 6), 62152, D['Sm152'])
                        for key, value in D.items():
                            if key != 'density' and key != 'Sm152':
                                if key == 'H':
                                    key = 'H001'
                                elif key == 'Zn':
                                    key = 'Zr090'
                                L = str(elems[''.join([i for i in key if not i.isdigit()])])
                                N = ''.join([i for i in key if i.isdigit()])
                                if len(N) == 2: N = '0' + N
                                s += '      {}.71c -{}\n'.format(L + N, value)
        return s
        
    def getFuelPlanes(self):
        # Compute the surface ID for each z plane in the fuel rods
        z_fuel_bot = -19.05
        z_fuel_top = 19.05
        self.fuelPlanes = linspace(z_fuel_top, z_fuel_bot, self.nAxialDiv + 1)[1:-1]
        self.fuelPlaneID = [10] + [100 + i for i in range(self.nAxialDiv - 1)] + [13]
        
    def writeVolumes(self):
        # Get the cell volumes
        self.getVolumes()
        s = ''
        
        s += 'c Volume of each cell\n'
        s += 'VOL NO '
        for i, v in enumerate(self.V):
            s += '{: >9.8g} '.format(v)
            if (i + 1) % 7 == 0 and i != len(self.V) - 1:
                s += '&\n       '
        return s + '\n' 
        
    def makeFile(self, outputName):
        self.getFuelPlanes()
        
        s = ''
        s += 'c KSU TRIGA Mark II\n'
        s += 'c\n'
        s += 'c Core with no 12% elements\n'
        s += 'c\n'
        s += self.getCells()
        s += '\n'
        s += self.getSurfaces()
        s += '\n'
        s += 'tr1  0 0 0 0.6428 0.776 0 -0.776 0.6428 0 0 0 1\n'
        s += 'mode  n\n'
        s += 'kcode 100000 1.000000 30 250\n'
        s += 'c    MATERIAL CARDS\n'
        s += 'c    U + Zr-H  rho=5.7473 g/cm^3 BOL\n'
        s += 'c    S(a,b)- Zr-H @ 300 K\n'
        s += 'c ******************************************************************************\n'
        s += 'c This current model accounts for the burnup of U235 and isotopes produced\n'
        s += self.writeFuelMats()
        s += 'c ******************************************************************************\n'
        s += 'c graphite rho = 1.6   g/cm^3\n'
        s += 'c S(a,b)- Carbon @ 300K\n'
        s += 'm2    6000.70c             -1  $MAT\n'
        s += 'c  Air rho = 0.001239 $ RSR AIR\n'
        s += 'm3 6000.70c -0.000124 7014.70c -0.755268 8016.70c -0.231781 18000 -0.012827\n'
        s += 'c Light water rho=1.00 g/cm^3\n'
        s += 'c S(a,b)- H20 @ 300K\n'
        s += 'm6    1001.70c        0.66667  $ Water\n'
        s += '      8016.70c        0.33333\n'
        s += 'c Aluminum rho = 2.699 g/cm^3\n'
        s += 'm7    13027.70c            -1  $ Aluminum, 2.699 g/cc\n'
        s += 'c Zirconium $ Zirc  Filler, 6.5 g/cc\n'
        s += 'c S(a,b)- H20 @ 300K\n'
        s += 'm8    40090.71c  -1\n'
        s += 'c Stainless Steel rho =  7.9 g/cm^3\n'
        s += 'c m9  26000.55c   -1.0\n'
        s += 'm9    26000.55c    -0.67  $MAT\n'
        s += '      24000.50c    -0.17\n'
        s += '      28000.50c    -0.08849997\n'
        s += '      42096.70c    -0.004452\n'
        s += 'c B4C SHIM & REG rod rho > 2.48 g/cm^3, email from GA,\n'
        s += 'c NEED TO ADJUST FOR BURNUP TO DIFFERENTIATE BETWEEN NEW ROD??\n'
        s += 'c rho 1.60-1.75 g/cm^3 from B. Ma\n'
        s += 'c 16% Boron from UIC TRIGA SAR\n'
        s += 'm11   6000.70c          -0.84  $ Pulse Rod, 1.6 g/cc,\n'
        s += '      5010.70c          -0.0296\n'
        s += '      5011.70c          -0.1304\n'
        s += 'c B4C rho > 2.48 g/cc, SHIM & REG, BUT THESE ARE OLD & PART BURNED\n'
        s += 'm12   6000.70c          -0.22  $ Shim Rod, 2.5 g/cc\n'
        s += '      5010.70c          -0.1443\n'
        s += '      5011.70c          -0.6357\n'
        s += 'c B4C rho >2.48 g/cc, SAFETY ROD\n'
        s += 'm13   6000.70c          -0.22  $ Shim Rod, 2.5 g/cc\n'
        s += '      5010.70c          -0.1443\n'
        s += '      5011.70c          -0.6357\n'
        s += 'c ******************************************************************************\n'
        s += 'imp:n             0            1 {}r          $ 1, 63012\n'.format(1080 + 85 * self.nRadialDiv * self.nAxialDiv)
        s += 'c ******************************************************************************\n'
        s += self.writeVolumes()
        s += 'c ******************************************************************************\n'
        s += 'c SOURCE DISTRIBUTED ACROSS THE CORE VOLUME\n'
        s += 'sdef ERG=D1 POS=0 0 -29 AXS=0 0 1 RAD=D2 EXT=D3\n'
        s += 'sp1 -3\n'
        s += 'si2 0 22.8\n'
        s += 'si3 0 45.7\n'
        s += 'c ******************************************************************************\n'
        s += 'mt2     grph.01T\n'
        s += 'mt6     lwtr.01\n'
        s += self.writeTally(self.fuelID)
        
        # Write string to file
        with open(outputName if outputName else 'triga.i', 'w') as f:
            f.write(s)
            
if __name__ == '__main__':
    nAxialDiv = 1
    nRadialDiv = 1
    data = makeFuelData('currentConfig.txt')
    cntl = controlRods(reg=40, shim=50, pulse=100, safety=10, worthWeighted=True)
    writer(nAxialDiv, nRadialDiv, data, cntl)
