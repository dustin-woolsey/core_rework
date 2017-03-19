c KSU TRIGA Mark II
c
c Core with no 12% elements
c
c CELLS:
    1     0         1 :-20 :38  $ OUTSIDE
    2     6      -1 (((-1 2 -38 ):(-2 7 -38 44 ): $ POOL ELEMENTS
            (-17 18 -38 30 ):(-18 20 -38 ):(-7 17 -38 37 )):
            (-15 18 -38 43 ))#7 #8
    3     6      -1 -34 33 -7 11  $ RSR SPACE/VOLUME
    4     7  -2.699 -35 32 -9 12 #3  $ RSR WALLS
    5     2    -1.6 -36 31 -9 16 #3 #4 #7 #8  $ REFLECTOR GRAPHITE
    6     7  -2.699 -37 30 -7 17 #3 #4 #5 #7 #8  $ CANNISTER/WALLS
    7     7  -2.699 31 -40 90 -38 26  $ NEBP AL CASE
    8     3 -0.001239 31 -90 -38 26  $ NEBP CAVITY
    9     0         (-30 -7 15 ):(-44 -2 7 ) fill=7 $ CORE SPACE
   10     7  -2.699 -15 18 -43 203  $ Lower grid plate
   11     0         -15 18 -203  fill=4 $ CT penetration, lower grid plate
c ** UNIVERSES
c ******************************************************************************
c ** WATER IN CORE AREA: UNIVERSE = [8]
   95     6   -1         20              u=8  $ Water above pool bottom
   96     7   -2.699    -20              u=8  $ Stuff below pool bottom
c ** CONTROL ROD UNIVERSES
c ** NOTE: Holes in guide tubes modeled as reduced Al density
c    (101, 110, 120, 126)
c ** PULSE ROD: UNIVERSE = [21]
  101     7  -2.12  210                  u=21 $ Guide Tube
  102     7  -2.699 50 -68 213 -214      u=21 $ Rod cladding
  103    11  -2.0   50 -68 -213          u=21 $ Pulse rod
  104     9  -7.9   68 -217 218          u=21 $ SS extension
  105     6  -1    -210 #102 #103 #104   u=21 $ Water
c ** SAFETY ROD: UNIVERSE = [22]
  110     7  -2.12  210                  u=22 $ Guide Tube
  111    13  -2.52  51 -68 -212          u=22 $ Safety rod
  112     9  -7.9   68 -217 218          u=22 $ SS extension
  113     6  -1    -210 #111 #112        u=22 $ Water
c ** SHIM ROD: UNIVERSE = [23]
  120     7  -2.12  210                  u=23 $ Guide Tube
  121     7  -2.699 52 -68 211 -212      u=23 $ Rod cladding
  122    12  -2.48  52 -68 -211          u=23 $ Shim/safety rod
  123     9  -7.9   68 -217 218          u=23 $ SS extension
  124     6  -1   -210 #121 #122 #123    u=23 $ Water
c ** REGULATING ROD: UNIVERSE = [24]
  126     7  -2.12 219                   u=24 $ Guide Tube
  127     7  -2.699 53 -68  215 -216     u=24 $ Rod cladding
  128    12  -2.48  53 -68 -215          u=24 $ Regulating rod
  129     9  -7.9   68 218 -217          u=24 $ SS extension
  130     6  -1    -219 #127 #128 #129   u=24 $ Water
c ******************************************************************************
c ** FUEL UNIVERSES: Individual FE's modeled for burnup as of 3-31-10
c ==============================================================================
  20101   6   -1 -21 201                 u=201    $ Water around lower pin
  20102   9   -7.9 -21 -201              u=201    $ Bottom pin
  20103   9   -7.9 -14 21                u=201    $ BOTTOM SS cap
  20104   2   -1.6 14 -13 -202           u=201    $ BOTTOM Axial reflector
  20105   9   -7.9 14 -4 202             u=201    $ Cladding
  20106   8   -6.5 13 -10 -200           u=201    $ Zirc FILLER
  20107   2   -1.6 10 -6 -202            u=201    $ TOP Axial reflector
  20108   3   -0.001239 6 -4 -202        u=201    $ Air gap
  20109   9   -7.9 4 -3                  u=201    $ TOP SS cap
  20110   9   -7.9 3 -201                u=201    $ Upper pin
  20111   6   -1 3 201                   u=201    $ Water around pin
  20112   201   -5.685 100 -10 200 -202   u=201    $ ELEMENT B-1.1  S/N:6315
  20113   201   -5.685 101 -100 200 -202   u=201    $ ELEMENT B-1.2  S/N:6315
  20114   201   -5.685 102 -101 200 -202   u=201    $ ELEMENT B-1.3  S/N:6315
  20115   201   -5.685 103 -102 200 -202   u=201    $ ELEMENT B-1.4  S/N:6315
  20116   201   -5.685 104 -103 200 -202   u=201    $ ELEMENT B-1.5  S/N:6315
  20117   201   -5.685 105 -104 200 -202   u=201    $ ELEMENT B-1.6  S/N:6315
  20118   201   -5.685 106 -105 200 -202   u=201    $ ELEMENT B-1.7  S/N:6315
  20119   201   -5.685 13 -106 200 -202   u=201    $ ELEMENT B-1.8  S/N:6315
c ==============================================================================
  20201 like 20101 but u=202
  20202 like 20102 but u=202
  20203 like 20103 but u=202
  20204 like 20104 but u=202
  20205 like 20105 but u=202
  20206 like 20106 but u=202
  20207 like 20107 but u=202
  20208 like 20108 but u=202
  20209 like 20109 but u=202
  20210 like 20110 but u=202
  20211 like 20111 but u=202
  20212 like 20112 but mat=202 rho=-5.681 u=202   $ ELEMENT B-2.1  S/N:10880
  20213 like 20113 but mat=202 rho=-5.681 u=202   $ ELEMENT B-2.2  S/N:10880
  20214 like 20114 but mat=202 rho=-5.681 u=202   $ ELEMENT B-2.3  S/N:10880
  20215 like 20115 but mat=202 rho=-5.681 u=202   $ ELEMENT B-2.4  S/N:10880
  20216 like 20116 but mat=202 rho=-5.681 u=202   $ ELEMENT B-2.5  S/N:10880
  20217 like 20117 but mat=202 rho=-5.681 u=202   $ ELEMENT B-2.6  S/N:10880
  20218 like 20118 but mat=202 rho=-5.681 u=202   $ ELEMENT B-2.7  S/N:10880
  20219 like 20119 but mat=202 rho=-5.681 u=202   $ ELEMENT B-2.8  S/N:10880
c ==============================================================================
  20301 like 20101 but u=203
  20302 like 20102 but u=203
  20303 like 20103 but u=203
  20304 like 20104 but u=203
  20305 like 20105 but u=203
  20306 like 20106 but u=203
  20307 like 20107 but u=203
  20308 like 20108 but u=203
  20309 like 20109 but u=203
  20310 like 20110 but u=203
  20311 like 20111 but u=203
  20312 like 20112 but mat=203 rho=-5.685 u=203   $ ELEMENT B-3.1  S/N:6577
  20313 like 20113 but mat=203 rho=-5.685 u=203   $ ELEMENT B-3.2  S/N:6577
  20314 like 20114 but mat=203 rho=-5.685 u=203   $ ELEMENT B-3.3  S/N:6577
  20315 like 20115 but mat=203 rho=-5.685 u=203   $ ELEMENT B-3.4  S/N:6577
  20316 like 20116 but mat=203 rho=-5.685 u=203   $ ELEMENT B-3.5  S/N:6577
  20317 like 20117 but mat=203 rho=-5.685 u=203   $ ELEMENT B-3.6  S/N:6577
  20318 like 20118 but mat=203 rho=-5.685 u=203   $ ELEMENT B-3.7  S/N:6577
  20319 like 20119 but mat=203 rho=-5.685 u=203   $ ELEMENT B-3.8  S/N:6577
c ==============================================================================
  20401 like 20101 but u=204
  20402 like 20102 but u=204
  20403 like 20103 but u=204
  20404 like 20104 but u=204
  20405 like 20105 but u=204
  20406 like 20106 but u=204
  20407 like 20107 but u=204
  20408 like 20108 but u=204
  20409 like 20109 but u=204
  20410 like 20110 but u=204
  20411 like 20111 but u=204
  20412 like 20112 but mat=204 rho=-5.688 u=204   $ ELEMENT B-4.1  S/N:2966
  20413 like 20113 but mat=204 rho=-5.688 u=204   $ ELEMENT B-4.2  S/N:2966
  20414 like 20114 but mat=204 rho=-5.688 u=204   $ ELEMENT B-4.3  S/N:2966
  20415 like 20115 but mat=204 rho=-5.688 u=204   $ ELEMENT B-4.4  S/N:2966
  20416 like 20116 but mat=204 rho=-5.688 u=204   $ ELEMENT B-4.5  S/N:2966
  20417 like 20117 but mat=204 rho=-5.688 u=204   $ ELEMENT B-4.6  S/N:2966
  20418 like 20118 but mat=204 rho=-5.688 u=204   $ ELEMENT B-4.7  S/N:2966
  20419 like 20119 but mat=204 rho=-5.688 u=204   $ ELEMENT B-4.8  S/N:2966
c ==============================================================================
  20501 like 20101 but u=205
  20502 like 20102 but u=205
  20503 like 20103 but u=205
  20504 like 20104 but u=205
  20505 like 20105 but u=205
  20506 like 20106 but u=205
  20507 like 20107 but u=205
  20508 like 20108 but u=205
  20509 like 20109 but u=205
  20510 like 20110 but u=205
  20511 like 20111 but u=205
  20512 like 20112 but mat=205 rho=-5.684 u=205   $ ELEMENT B-5.1  S/N:10707
  20513 like 20113 but mat=205 rho=-5.684 u=205   $ ELEMENT B-5.2  S/N:10707
  20514 like 20114 but mat=205 rho=-5.684 u=205   $ ELEMENT B-5.3  S/N:10707
  20515 like 20115 but mat=205 rho=-5.684 u=205   $ ELEMENT B-5.4  S/N:10707
  20516 like 20116 but mat=205 rho=-5.684 u=205   $ ELEMENT B-5.5  S/N:10707
  20517 like 20117 but mat=205 rho=-5.684 u=205   $ ELEMENT B-5.6  S/N:10707
  20518 like 20118 but mat=205 rho=-5.684 u=205   $ ELEMENT B-5.7  S/N:10707
  20519 like 20119 but mat=205 rho=-5.684 u=205   $ ELEMENT B-5.8  S/N:10707
c ==============================================================================
  20601 like 20101 but u=206
  20602 like 20102 but u=206
  20603 like 20103 but u=206
  20604 like 20104 but u=206
  20605 like 20105 but u=206
  20606 like 20106 but u=206
  20607 like 20107 but u=206
  20608 like 20108 but u=206
  20609 like 20109 but u=206
  20610 like 20110 but u=206
  20611 like 20111 but u=206
  20612 like 20112 but mat=206 rho=-5.684 u=206   $ ELEMENT B-6.1  S/N:6525
  20613 like 20113 but mat=206 rho=-5.684 u=206   $ ELEMENT B-6.2  S/N:6525
  20614 like 20114 but mat=206 rho=-5.684 u=206   $ ELEMENT B-6.3  S/N:6525
  20615 like 20115 but mat=206 rho=-5.684 u=206   $ ELEMENT B-6.4  S/N:6525
  20616 like 20116 but mat=206 rho=-5.684 u=206   $ ELEMENT B-6.5  S/N:6525
  20617 like 20117 but mat=206 rho=-5.684 u=206   $ ELEMENT B-6.6  S/N:6525
  20618 like 20118 but mat=206 rho=-5.684 u=206   $ ELEMENT B-6.7  S/N:6525
  20619 like 20119 but mat=206 rho=-5.684 u=206   $ ELEMENT B-6.8  S/N:6525
c ==============================================================================
  30101 like 20101 but u=301
  30102 like 20102 but u=301
  30103 like 20103 but u=301
  30104 like 20104 but u=301
  30105 like 20105 but u=301
  30106 like 20106 but u=301
  30107 like 20107 but u=301
  30108 like 20108 but u=301
  30109 like 20109 but u=301
  30110 like 20110 but u=301
  30111 like 20111 but u=301
  30112 like 20112 but mat=301 rho=-5.680 u=301   $ ELEMENT C-1.1  S/N:11351
  30113 like 20113 but mat=301 rho=-5.680 u=301   $ ELEMENT C-1.2  S/N:11351
  30114 like 20114 but mat=301 rho=-5.680 u=301   $ ELEMENT C-1.3  S/N:11351
  30115 like 20115 but mat=301 rho=-5.680 u=301   $ ELEMENT C-1.4  S/N:11351
  30116 like 20116 but mat=301 rho=-5.680 u=301   $ ELEMENT C-1.5  S/N:11351
  30117 like 20117 but mat=301 rho=-5.680 u=301   $ ELEMENT C-1.6  S/N:11351
  30118 like 20118 but mat=301 rho=-5.680 u=301   $ ELEMENT C-1.7  S/N:11351
  30119 like 20119 but mat=301 rho=-5.680 u=301   $ ELEMENT C-1.8  S/N:11351
c ==============================================================================
  30201 like 20101 but u=302
  30202 like 20102 but u=302
  30203 like 20103 but u=302
  30204 like 20104 but u=302
  30205 like 20105 but u=302
  30206 like 20106 but u=302
  30207 like 20107 but u=302
  30208 like 20108 but u=302
  30209 like 20109 but u=302
  30210 like 20110 but u=302
  30211 like 20111 but u=302
  30212 like 20112 but mat=302 rho=-5.684 u=302   $ ELEMENT C-2.1  S/N:6316
  30213 like 20113 but mat=302 rho=-5.684 u=302   $ ELEMENT C-2.2  S/N:6316
  30214 like 20114 but mat=302 rho=-5.684 u=302   $ ELEMENT C-2.3  S/N:6316
  30215 like 20115 but mat=302 rho=-5.684 u=302   $ ELEMENT C-2.4  S/N:6316
  30216 like 20116 but mat=302 rho=-5.684 u=302   $ ELEMENT C-2.5  S/N:6316
  30217 like 20117 but mat=302 rho=-5.684 u=302   $ ELEMENT C-2.6  S/N:6316
  30218 like 20118 but mat=302 rho=-5.684 u=302   $ ELEMENT C-2.7  S/N:6316
  30219 like 20119 but mat=302 rho=-5.684 u=302   $ ELEMENT C-2.8  S/N:6316
c ==============================================================================
  30301 like 20101 but u=303
  30302 like 20102 but u=303
  30303 like 20103 but u=303
  30304 like 20104 but u=303
  30305 like 20105 but u=303
  30306 like 20106 but u=303
  30307 like 20107 but u=303
  30308 like 20108 but u=303
  30309 like 20109 but u=303
  30310 like 20110 but u=303
  30311 like 20111 but u=303
  30312 like 20112 but mat=303 rho=-5.691 u=303   $ ELEMENT C-3.1  S/N:2963
  30313 like 20113 but mat=303 rho=-5.691 u=303   $ ELEMENT C-3.2  S/N:2963
  30314 like 20114 but mat=303 rho=-5.691 u=303   $ ELEMENT C-3.3  S/N:2963
  30315 like 20115 but mat=303 rho=-5.691 u=303   $ ELEMENT C-3.4  S/N:2963
  30316 like 20116 but mat=303 rho=-5.691 u=303   $ ELEMENT C-3.5  S/N:2963
  30317 like 20117 but mat=303 rho=-5.691 u=303   $ ELEMENT C-3.6  S/N:2963
  30318 like 20118 but mat=303 rho=-5.691 u=303   $ ELEMENT C-3.7  S/N:2963
  30319 like 20119 but mat=303 rho=-5.691 u=303   $ ELEMENT C-3.8  S/N:2963
c ==============================================================================
  30401 like 20101 but u=304
  30402 like 20102 but u=304
  30403 like 20103 but u=304
  30404 like 20104 but u=304
  30405 like 20105 but u=304
  30406 like 20106 but u=304
  30407 like 20107 but u=304
  30408 like 20108 but u=304
  30409 like 20109 but u=304
  30410 like 20110 but u=304
  30411 like 20111 but u=304
  30412 like 20112 but mat=304 rho=-5.638 u=304   $ ELEMENT C-4.1  S/N:3329
  30413 like 20113 but mat=304 rho=-5.638 u=304   $ ELEMENT C-4.2  S/N:3329
  30414 like 20114 but mat=304 rho=-5.638 u=304   $ ELEMENT C-4.3  S/N:3329
  30415 like 20115 but mat=304 rho=-5.638 u=304   $ ELEMENT C-4.4  S/N:3329
  30416 like 20116 but mat=304 rho=-5.638 u=304   $ ELEMENT C-4.5  S/N:3329
  30417 like 20117 but mat=304 rho=-5.638 u=304   $ ELEMENT C-4.6  S/N:3329
  30418 like 20118 but mat=304 rho=-5.638 u=304   $ ELEMENT C-4.7  S/N:3329
  30419 like 20119 but mat=304 rho=-5.638 u=304   $ ELEMENT C-4.8  S/N:3329
c ==============================================================================
  30501 like 20101 but u=305
  30502 like 20102 but u=305
  30503 like 20103 but u=305
  30504 like 20104 but u=305
  30505 like 20105 but u=305
  30506 like 20106 but u=305
  30507 like 20107 but u=305
  30508 like 20108 but u=305
  30509 like 20109 but u=305
  30510 like 20110 but u=305
  30511 like 20111 but u=305
  30512 like 20112 but mat=305 rho=-5.710 u=305   $ ELEMENT C-5.1  S/N:2953
  30513 like 20113 but mat=305 rho=-5.710 u=305   $ ELEMENT C-5.2  S/N:2953
  30514 like 20114 but mat=305 rho=-5.710 u=305   $ ELEMENT C-5.3  S/N:2953
  30515 like 20115 but mat=305 rho=-5.710 u=305   $ ELEMENT C-5.4  S/N:2953
  30516 like 20116 but mat=305 rho=-5.710 u=305   $ ELEMENT C-5.5  S/N:2953
  30517 like 20117 but mat=305 rho=-5.710 u=305   $ ELEMENT C-5.6  S/N:2953
  30518 like 20118 but mat=305 rho=-5.710 u=305   $ ELEMENT C-5.7  S/N:2953
  30519 like 20119 but mat=305 rho=-5.710 u=305   $ ELEMENT C-5.8  S/N:2953
c ==============================================================================
  30601 like 20101 but u=306
  30602 like 20102 but u=306
  30603 like 20103 but u=306
  30604 like 20104 but u=306
  30605 like 20105 but u=306
  30606 like 20106 but u=306
  30607 like 20107 but u=306
  30608 like 20108 but u=306
  30609 like 20109 but u=306
  30610 like 20110 but u=306
  30611 like 20111 but u=306
  30612 like 20112 but mat=306 rho=-5.649 u=306   $ ELEMENT C-6.1  S/N:3082
  30613 like 20113 but mat=306 rho=-5.649 u=306   $ ELEMENT C-6.2  S/N:3082
  30614 like 20114 but mat=306 rho=-5.649 u=306   $ ELEMENT C-6.3  S/N:3082
  30615 like 20115 but mat=306 rho=-5.649 u=306   $ ELEMENT C-6.4  S/N:3082
  30616 like 20116 but mat=306 rho=-5.649 u=306   $ ELEMENT C-6.5  S/N:3082
  30617 like 20117 but mat=306 rho=-5.649 u=306   $ ELEMENT C-6.6  S/N:3082
  30618 like 20118 but mat=306 rho=-5.649 u=306   $ ELEMENT C-6.7  S/N:3082
  30619 like 20119 but mat=306 rho=-5.649 u=306   $ ELEMENT C-6.8  S/N:3082
c ==============================================================================
  30801 like 20101 but u=308
  30802 like 20102 but u=308
  30803 like 20103 but u=308
  30804 like 20104 but u=308
  30805 like 20105 but u=308
  30806 like 20106 but u=308
  30807 like 20107 but u=308
  30808 like 20108 but u=308
  30809 like 20109 but u=308
  30810 like 20110 but u=308
  30811 like 20111 but u=308
  30812 like 20112 but mat=308 rho=-5.693 u=308   $ ELEMENT C-8.1  S/N:2933
  30813 like 20113 but mat=308 rho=-5.693 u=308   $ ELEMENT C-8.2  S/N:2933
  30814 like 20114 but mat=308 rho=-5.693 u=308   $ ELEMENT C-8.3  S/N:2933
  30815 like 20115 but mat=308 rho=-5.693 u=308   $ ELEMENT C-8.4  S/N:2933
  30816 like 20116 but mat=308 rho=-5.693 u=308   $ ELEMENT C-8.5  S/N:2933
  30817 like 20117 but mat=308 rho=-5.693 u=308   $ ELEMENT C-8.6  S/N:2933
  30818 like 20118 but mat=308 rho=-5.693 u=308   $ ELEMENT C-8.7  S/N:2933
  30819 like 20119 but mat=308 rho=-5.693 u=308   $ ELEMENT C-8.8  S/N:2933
c ==============================================================================
  30901 like 20101 but u=309
  30902 like 20102 but u=309
  30903 like 20103 but u=309
  30904 like 20104 but u=309
  30905 like 20105 but u=309
  30906 like 20106 but u=309
  30907 like 20107 but u=309
  30908 like 20108 but u=309
  30909 like 20109 but u=309
  30910 like 20110 but u=309
  30911 like 20111 but u=309
  30912 like 20112 but mat=309 rho=-5.684 u=309   $ ELEMENT C-9.1  S/N:6314
  30913 like 20113 but mat=309 rho=-5.684 u=309   $ ELEMENT C-9.2  S/N:6314
  30914 like 20114 but mat=309 rho=-5.684 u=309   $ ELEMENT C-9.3  S/N:6314
  30915 like 20115 but mat=309 rho=-5.684 u=309   $ ELEMENT C-9.4  S/N:6314
  30916 like 20116 but mat=309 rho=-5.684 u=309   $ ELEMENT C-9.5  S/N:6314
  30917 like 20117 but mat=309 rho=-5.684 u=309   $ ELEMENT C-9.6  S/N:6314
  30918 like 20118 but mat=309 rho=-5.684 u=309   $ ELEMENT C-9.7  S/N:6314
  30919 like 20119 but mat=309 rho=-5.684 u=309   $ ELEMENT C-9.8  S/N:6314
c ==============================================================================
  31001 like 20101 but u=310
  31002 like 20102 but u=310
  31003 like 20103 but u=310
  31004 like 20104 but u=310
  31005 like 20105 but u=310
  31006 like 20106 but u=310
  31007 like 20107 but u=310
  31008 like 20108 but u=310
  31009 like 20109 but u=310
  31010 like 20110 but u=310
  31011 like 20111 but u=310
  31012 like 20112 but mat=310 rho=-5.684 u=310   $ ELEMENT C-10.1  S/N:6527
  31013 like 20113 but mat=310 rho=-5.684 u=310   $ ELEMENT C-10.2  S/N:6527
  31014 like 20114 but mat=310 rho=-5.684 u=310   $ ELEMENT C-10.3  S/N:6527
  31015 like 20115 but mat=310 rho=-5.684 u=310   $ ELEMENT C-10.4  S/N:6527
  31016 like 20116 but mat=310 rho=-5.684 u=310   $ ELEMENT C-10.5  S/N:6527
  31017 like 20117 but mat=310 rho=-5.684 u=310   $ ELEMENT C-10.6  S/N:6527
  31018 like 20118 but mat=310 rho=-5.684 u=310   $ ELEMENT C-10.7  S/N:6527
  31019 like 20119 but mat=310 rho=-5.684 u=310   $ ELEMENT C-10.8  S/N:6527
c ==============================================================================
  31101 like 20101 but u=311
  31102 like 20102 but u=311
  31103 like 20103 but u=311
  31104 like 20104 but u=311
  31105 like 20105 but u=311
  31106 like 20106 but u=311
  31107 like 20107 but u=311
  31108 like 20108 but u=311
  31109 like 20109 but u=311
  31110 like 20110 but u=311
  31111 like 20111 but u=311
  31112 like 20112 but mat=311 rho=-5.684 u=311   $ ELEMENT C-11.1  S/N:6317
  31113 like 20113 but mat=311 rho=-5.684 u=311   $ ELEMENT C-11.2  S/N:6317
  31114 like 20114 but mat=311 rho=-5.684 u=311   $ ELEMENT C-11.3  S/N:6317
  31115 like 20115 but mat=311 rho=-5.684 u=311   $ ELEMENT C-11.4  S/N:6317
  31116 like 20116 but mat=311 rho=-5.684 u=311   $ ELEMENT C-11.5  S/N:6317
  31117 like 20117 but mat=311 rho=-5.684 u=311   $ ELEMENT C-11.6  S/N:6317
  31118 like 20118 but mat=311 rho=-5.684 u=311   $ ELEMENT C-11.7  S/N:6317
  31119 like 20119 but mat=311 rho=-5.684 u=311   $ ELEMENT C-11.8  S/N:6317
c ==============================================================================
  31201 like 20101 but u=312
  31202 like 20102 but u=312
  31203 like 20103 but u=312
  31204 like 20104 but u=312
  31205 like 20105 but u=312
  31206 like 20106 but u=312
  31207 like 20107 but u=312
  31208 like 20108 but u=312
  31209 like 20109 but u=312
  31210 like 20110 but u=312
  31211 like 20111 but u=312
  31212 like 20112 but mat=312 rho=-5.684 u=312   $ ELEMENT C-12.1  S/N:6526
  31213 like 20113 but mat=312 rho=-5.684 u=312   $ ELEMENT C-12.2  S/N:6526
  31214 like 20114 but mat=312 rho=-5.684 u=312   $ ELEMENT C-12.3  S/N:6526
  31215 like 20115 but mat=312 rho=-5.684 u=312   $ ELEMENT C-12.4  S/N:6526
  31216 like 20116 but mat=312 rho=-5.684 u=312   $ ELEMENT C-12.5  S/N:6526
  31217 like 20117 but mat=312 rho=-5.684 u=312   $ ELEMENT C-12.6  S/N:6526
  31218 like 20118 but mat=312 rho=-5.684 u=312   $ ELEMENT C-12.7  S/N:6526
  31219 like 20119 but mat=312 rho=-5.684 u=312   $ ELEMENT C-12.8  S/N:6526
c ==============================================================================
  40101 like 20101 but u=401
  40102 like 20102 but u=401
  40103 like 20103 but u=401
  40104 like 20104 but u=401
  40105 like 20105 but u=401
  40106 like 20106 but u=401
  40107 like 20107 but u=401
  40108 like 20108 but u=401
  40109 like 20109 but u=401
  40110 like 20110 but u=401
  40111 like 20111 but u=401
  40112 like 20112 but mat=401 rho=-5.637 u=401   $ ELEMENT D-1.1  S/N:3380
  40113 like 20113 but mat=401 rho=-5.637 u=401   $ ELEMENT D-1.2  S/N:3380
  40114 like 20114 but mat=401 rho=-5.637 u=401   $ ELEMENT D-1.3  S/N:3380
  40115 like 20115 but mat=401 rho=-5.637 u=401   $ ELEMENT D-1.4  S/N:3380
  40116 like 20116 but mat=401 rho=-5.637 u=401   $ ELEMENT D-1.5  S/N:3380
  40117 like 20117 but mat=401 rho=-5.637 u=401   $ ELEMENT D-1.6  S/N:3380
  40118 like 20118 but mat=401 rho=-5.637 u=401   $ ELEMENT D-1.7  S/N:3380
  40119 like 20119 but mat=401 rho=-5.637 u=401   $ ELEMENT D-1.8  S/N:3380
c ==============================================================================
  40201 like 20101 but u=402
  40202 like 20102 but u=402
  40203 like 20103 but u=402
  40204 like 20104 but u=402
  40205 like 20105 but u=402
  40206 like 20106 but u=402
  40207 like 20107 but u=402
  40208 like 20108 but u=402
  40209 like 20109 but u=402
  40210 like 20110 but u=402
  40211 like 20111 but u=402
  40212 like 20112 but mat=402 rho=-5.655 u=402   $ ELEMENT D-2.1  S/N:3330
  40213 like 20113 but mat=402 rho=-5.655 u=402   $ ELEMENT D-2.2  S/N:3330
  40214 like 20114 but mat=402 rho=-5.655 u=402   $ ELEMENT D-2.3  S/N:3330
  40215 like 20115 but mat=402 rho=-5.655 u=402   $ ELEMENT D-2.4  S/N:3330
  40216 like 20116 but mat=402 rho=-5.655 u=402   $ ELEMENT D-2.5  S/N:3330
  40217 like 20117 but mat=402 rho=-5.655 u=402   $ ELEMENT D-2.6  S/N:3330
  40218 like 20118 but mat=402 rho=-5.655 u=402   $ ELEMENT D-2.7  S/N:3330
  40219 like 20119 but mat=402 rho=-5.655 u=402   $ ELEMENT D-2.8  S/N:3330
c ==============================================================================
  40301 like 20101 but u=403
  40302 like 20102 but u=403
  40303 like 20103 but u=403
  40304 like 20104 but u=403
  40305 like 20105 but u=403
  40306 like 20106 but u=403
  40307 like 20107 but u=403
  40308 like 20108 but u=403
  40309 like 20109 but u=403
  40310 like 20110 but u=403
  40311 like 20111 but u=403
  40312 like 20112 but mat=403 rho=-5.626 u=403   $ ELEMENT D-3.1  S/N:5001
  40313 like 20113 but mat=403 rho=-5.626 u=403   $ ELEMENT D-3.2  S/N:5001
  40314 like 20114 but mat=403 rho=-5.626 u=403   $ ELEMENT D-3.3  S/N:5001
  40315 like 20115 but mat=403 rho=-5.626 u=403   $ ELEMENT D-3.4  S/N:5001
  40316 like 20116 but mat=403 rho=-5.626 u=403   $ ELEMENT D-3.5  S/N:5001
  40317 like 20117 but mat=403 rho=-5.626 u=403   $ ELEMENT D-3.6  S/N:5001
  40318 like 20118 but mat=403 rho=-5.626 u=403   $ ELEMENT D-3.7  S/N:5001
  40319 like 20119 but mat=403 rho=-5.626 u=403   $ ELEMENT D-3.8  S/N:5001
c ==============================================================================
  40501 like 20101 but u=405
  40502 like 20102 but u=405
  40503 like 20103 but u=405
  40504 like 20104 but u=405
  40505 like 20105 but u=405
  40506 like 20106 but u=405
  40507 like 20107 but u=405
  40508 like 20108 but u=405
  40509 like 20109 but u=405
  40510 like 20110 but u=405
  40511 like 20111 but u=405
  40512 like 20112 but mat=405 rho=-5.636 u=405   $ ELEMENT D-5.1  S/N:3144
  40513 like 20113 but mat=405 rho=-5.636 u=405   $ ELEMENT D-5.2  S/N:3144
  40514 like 20114 but mat=405 rho=-5.636 u=405   $ ELEMENT D-5.3  S/N:3144
  40515 like 20115 but mat=405 rho=-5.636 u=405   $ ELEMENT D-5.4  S/N:3144
  40516 like 20116 but mat=405 rho=-5.636 u=405   $ ELEMENT D-5.5  S/N:3144
  40517 like 20117 but mat=405 rho=-5.636 u=405   $ ELEMENT D-5.6  S/N:3144
  40518 like 20118 but mat=405 rho=-5.636 u=405   $ ELEMENT D-5.7  S/N:3144
  40519 like 20119 but mat=405 rho=-5.636 u=405   $ ELEMENT D-5.8  S/N:3144
c ==============================================================================
  40601 like 20101 but u=406
  40602 like 20102 but u=406
  40603 like 20103 but u=406
  40604 like 20104 but u=406
  40605 like 20105 but u=406
  40606 like 20106 but u=406
  40607 like 20107 but u=406
  40608 like 20108 but u=406
  40609 like 20109 but u=406
  40610 like 20110 but u=406
  40611 like 20111 but u=406
  40612 like 20112 but mat=406 rho=-5.646 u=406   $ ELEMENT D-6.1  S/N:6224
  40613 like 20113 but mat=406 rho=-5.646 u=406   $ ELEMENT D-6.2  S/N:6224
  40614 like 20114 but mat=406 rho=-5.646 u=406   $ ELEMENT D-6.3  S/N:6224
  40615 like 20115 but mat=406 rho=-5.646 u=406   $ ELEMENT D-6.4  S/N:6224
  40616 like 20116 but mat=406 rho=-5.646 u=406   $ ELEMENT D-6.5  S/N:6224
  40617 like 20117 but mat=406 rho=-5.646 u=406   $ ELEMENT D-6.6  S/N:6224
  40618 like 20118 but mat=406 rho=-5.646 u=406   $ ELEMENT D-6.7  S/N:6224
  40619 like 20119 but mat=406 rho=-5.646 u=406   $ ELEMENT D-6.8  S/N:6224
c ==============================================================================
  40701 like 20101 but u=407
  40702 like 20102 but u=407
  40703 like 20103 but u=407
  40704 like 20104 but u=407
  40705 like 20105 but u=407
  40706 like 20106 but u=407
  40707 like 20107 but u=407
  40708 like 20108 but u=407
  40709 like 20109 but u=407
  40710 like 20110 but u=407
  40711 like 20111 but u=407
  40712 like 20112 but mat=407 rho=-5.646 u=407   $ ELEMENT D-7.1  S/N:3018
  40713 like 20113 but mat=407 rho=-5.646 u=407   $ ELEMENT D-7.2  S/N:3018
  40714 like 20114 but mat=407 rho=-5.646 u=407   $ ELEMENT D-7.3  S/N:3018
  40715 like 20115 but mat=407 rho=-5.646 u=407   $ ELEMENT D-7.4  S/N:3018
  40716 like 20116 but mat=407 rho=-5.646 u=407   $ ELEMENT D-7.5  S/N:3018
  40717 like 20117 but mat=407 rho=-5.646 u=407   $ ELEMENT D-7.6  S/N:3018
  40718 like 20118 but mat=407 rho=-5.646 u=407   $ ELEMENT D-7.7  S/N:3018
  40719 like 20119 but mat=407 rho=-5.646 u=407   $ ELEMENT D-7.8  S/N:3018
c ==============================================================================
  40801 like 20101 but u=408
  40802 like 20102 but u=408
  40803 like 20103 but u=408
  40804 like 20104 but u=408
  40805 like 20105 but u=408
  40806 like 20106 but u=408
  40807 like 20107 but u=408
  40808 like 20108 but u=408
  40809 like 20109 but u=408
  40810 like 20110 but u=408
  40811 like 20111 but u=408
  40812 like 20112 but mat=408 rho=-5.636 u=408   $ ELEMENT D-8.1  S/N:3105
  40813 like 20113 but mat=408 rho=-5.636 u=408   $ ELEMENT D-8.2  S/N:3105
  40814 like 20114 but mat=408 rho=-5.636 u=408   $ ELEMENT D-8.3  S/N:3105
  40815 like 20115 but mat=408 rho=-5.636 u=408   $ ELEMENT D-8.4  S/N:3105
  40816 like 20116 but mat=408 rho=-5.636 u=408   $ ELEMENT D-8.5  S/N:3105
  40817 like 20117 but mat=408 rho=-5.636 u=408   $ ELEMENT D-8.6  S/N:3105
  40818 like 20118 but mat=408 rho=-5.636 u=408   $ ELEMENT D-8.7  S/N:3105
  40819 like 20119 but mat=408 rho=-5.636 u=408   $ ELEMENT D-8.8  S/N:3105
c ==============================================================================
  40901 like 20101 but u=409
  40902 like 20102 but u=409
  40903 like 20103 but u=409
  40904 like 20104 but u=409
  40905 like 20105 but u=409
  40906 like 20106 but u=409
  40907 like 20107 but u=409
  40908 like 20108 but u=409
  40909 like 20109 but u=409
  40910 like 20110 but u=409
  40911 like 20111 but u=409
  40912 like 20112 but mat=409 rho=-5.642 u=409   $ ELEMENT D-9.1  S/N:2452
  40913 like 20113 but mat=409 rho=-5.642 u=409   $ ELEMENT D-9.2  S/N:2452
  40914 like 20114 but mat=409 rho=-5.642 u=409   $ ELEMENT D-9.3  S/N:2452
  40915 like 20115 but mat=409 rho=-5.642 u=409   $ ELEMENT D-9.4  S/N:2452
  40916 like 20116 but mat=409 rho=-5.642 u=409   $ ELEMENT D-9.5  S/N:2452
  40917 like 20117 but mat=409 rho=-5.642 u=409   $ ELEMENT D-9.6  S/N:2452
  40918 like 20118 but mat=409 rho=-5.642 u=409   $ ELEMENT D-9.7  S/N:2452
  40919 like 20119 but mat=409 rho=-5.642 u=409   $ ELEMENT D-9.8  S/N:2452
c ==============================================================================
  41001 like 20101 but u=410
  41002 like 20102 but u=410
  41003 like 20103 but u=410
  41004 like 20104 but u=410
  41005 like 20105 but u=410
  41006 like 20106 but u=410
  41007 like 20107 but u=410
  41008 like 20108 but u=410
  41009 like 20109 but u=410
  41010 like 20110 but u=410
  41011 like 20111 but u=410
  41012 like 20112 but mat=410 rho=-5.632 u=410   $ ELEMENT D-10.1  S/N:2448
  41013 like 20113 but mat=410 rho=-5.632 u=410   $ ELEMENT D-10.2  S/N:2448
  41014 like 20114 but mat=410 rho=-5.632 u=410   $ ELEMENT D-10.3  S/N:2448
  41015 like 20115 but mat=410 rho=-5.632 u=410   $ ELEMENT D-10.4  S/N:2448
  41016 like 20116 but mat=410 rho=-5.632 u=410   $ ELEMENT D-10.5  S/N:2448
  41017 like 20117 but mat=410 rho=-5.632 u=410   $ ELEMENT D-10.6  S/N:2448
  41018 like 20118 but mat=410 rho=-5.632 u=410   $ ELEMENT D-10.7  S/N:2448
  41019 like 20119 but mat=410 rho=-5.632 u=410   $ ELEMENT D-10.8  S/N:2448
c ==============================================================================
  41101 like 20101 but u=411
  41102 like 20102 but u=411
  41103 like 20103 but u=411
  41104 like 20104 but u=411
  41105 like 20105 but u=411
  41106 like 20106 but u=411
  41107 like 20107 but u=411
  41108 like 20108 but u=411
  41109 like 20109 but u=411
  41110 like 20110 but u=411
  41111 like 20111 but u=411
  41112 like 20112 but mat=411 rho=-5.641 u=411   $ ELEMENT D-11.1  S/N:2435
  41113 like 20113 but mat=411 rho=-5.641 u=411   $ ELEMENT D-11.2  S/N:2435
  41114 like 20114 but mat=411 rho=-5.641 u=411   $ ELEMENT D-11.3  S/N:2435
  41115 like 20115 but mat=411 rho=-5.641 u=411   $ ELEMENT D-11.4  S/N:2435
  41116 like 20116 but mat=411 rho=-5.641 u=411   $ ELEMENT D-11.5  S/N:2435
  41117 like 20117 but mat=411 rho=-5.641 u=411   $ ELEMENT D-11.6  S/N:2435
  41118 like 20118 but mat=411 rho=-5.641 u=411   $ ELEMENT D-11.7  S/N:2435
  41119 like 20119 but mat=411 rho=-5.641 u=411   $ ELEMENT D-11.8  S/N:2435
c ==============================================================================
  41201 like 20101 but u=412
  41202 like 20102 but u=412
  41203 like 20103 but u=412
  41204 like 20104 but u=412
  41205 like 20105 but u=412
  41206 like 20106 but u=412
  41207 like 20107 but u=412
  41208 like 20108 but u=412
  41209 like 20109 but u=412
  41210 like 20110 but u=412
  41211 like 20111 but u=412
  41212 like 20112 but mat=412 rho=-5.655 u=412   $ ELEMENT D-12.1  S/N:3876
  41213 like 20113 but mat=412 rho=-5.655 u=412   $ ELEMENT D-12.2  S/N:3876
  41214 like 20114 but mat=412 rho=-5.655 u=412   $ ELEMENT D-12.3  S/N:3876
  41215 like 20115 but mat=412 rho=-5.655 u=412   $ ELEMENT D-12.4  S/N:3876
  41216 like 20116 but mat=412 rho=-5.655 u=412   $ ELEMENT D-12.5  S/N:3876
  41217 like 20117 but mat=412 rho=-5.655 u=412   $ ELEMENT D-12.6  S/N:3876
  41218 like 20118 but mat=412 rho=-5.655 u=412   $ ELEMENT D-12.7  S/N:3876
  41219 like 20119 but mat=412 rho=-5.655 u=412   $ ELEMENT D-12.8  S/N:3876
c ==============================================================================
  41301 like 20101 but u=413
  41302 like 20102 but u=413
  41303 like 20103 but u=413
  41304 like 20104 but u=413
  41305 like 20105 but u=413
  41306 like 20106 but u=413
  41307 like 20107 but u=413
  41308 like 20108 but u=413
  41309 like 20109 but u=413
  41310 like 20110 but u=413
  41311 like 20111 but u=413
  41312 like 20112 but mat=413 rho=-5.644 u=413   $ ELEMENT D-13.1  S/N:3696
  41313 like 20113 but mat=413 rho=-5.644 u=413   $ ELEMENT D-13.2  S/N:3696
  41314 like 20114 but mat=413 rho=-5.644 u=413   $ ELEMENT D-13.3  S/N:3696
  41315 like 20115 but mat=413 rho=-5.644 u=413   $ ELEMENT D-13.4  S/N:3696
  41316 like 20116 but mat=413 rho=-5.644 u=413   $ ELEMENT D-13.5  S/N:3696
  41317 like 20117 but mat=413 rho=-5.644 u=413   $ ELEMENT D-13.6  S/N:3696
  41318 like 20118 but mat=413 rho=-5.644 u=413   $ ELEMENT D-13.7  S/N:3696
  41319 like 20119 but mat=413 rho=-5.644 u=413   $ ELEMENT D-13.8  S/N:3696
c ==============================================================================
  41401 like 20101 but u=414
  41402 like 20102 but u=414
  41403 like 20103 but u=414
  41404 like 20104 but u=414
  41405 like 20105 but u=414
  41406 like 20106 but u=414
  41407 like 20107 but u=414
  41408 like 20108 but u=414
  41409 like 20109 but u=414
  41410 like 20110 but u=414
  41411 like 20111 but u=414
  41412 like 20112 but mat=414 rho=-5.669 u=414   $ ELEMENT D-14.1  S/N:3494
  41413 like 20113 but mat=414 rho=-5.669 u=414   $ ELEMENT D-14.2  S/N:3494
  41414 like 20114 but mat=414 rho=-5.669 u=414   $ ELEMENT D-14.3  S/N:3494
  41415 like 20115 but mat=414 rho=-5.669 u=414   $ ELEMENT D-14.4  S/N:3494
  41416 like 20116 but mat=414 rho=-5.669 u=414   $ ELEMENT D-14.5  S/N:3494
  41417 like 20117 but mat=414 rho=-5.669 u=414   $ ELEMENT D-14.6  S/N:3494
  41418 like 20118 but mat=414 rho=-5.669 u=414   $ ELEMENT D-14.7  S/N:3494
  41419 like 20119 but mat=414 rho=-5.669 u=414   $ ELEMENT D-14.8  S/N:3494
c ==============================================================================
  41501 like 20101 but u=415
  41502 like 20102 but u=415
  41503 like 20103 but u=415
  41504 like 20104 but u=415
  41505 like 20105 but u=415
  41506 like 20106 but u=415
  41507 like 20107 but u=415
  41508 like 20108 but u=415
  41509 like 20109 but u=415
  41510 like 20110 but u=415
  41511 like 20111 but u=415
  41512 like 20112 but mat=415 rho=-5.656 u=415   $ ELEMENT D-15.1  S/N:3501
  41513 like 20113 but mat=415 rho=-5.656 u=415   $ ELEMENT D-15.2  S/N:3501
  41514 like 20114 but mat=415 rho=-5.656 u=415   $ ELEMENT D-15.3  S/N:3501
  41515 like 20115 but mat=415 rho=-5.656 u=415   $ ELEMENT D-15.4  S/N:3501
  41516 like 20116 but mat=415 rho=-5.656 u=415   $ ELEMENT D-15.5  S/N:3501
  41517 like 20117 but mat=415 rho=-5.656 u=415   $ ELEMENT D-15.6  S/N:3501
  41518 like 20118 but mat=415 rho=-5.656 u=415   $ ELEMENT D-15.7  S/N:3501
  41519 like 20119 but mat=415 rho=-5.656 u=415   $ ELEMENT D-15.8  S/N:3501
c ==============================================================================
  41701 like 20101 but u=417
  41702 like 20102 but u=417
  41703 like 20103 but u=417
  41704 like 20104 but u=417
  41705 like 20105 but u=417
  41706 like 20106 but u=417
  41707 like 20107 but u=417
  41708 like 20108 but u=417
  41709 like 20109 but u=417
  41710 like 20110 but u=417
  41711 like 20111 but u=417
  41712 like 20112 but mat=417 rho=-5.656 u=417   $ ELEMENT D-17.1  S/N:3498
  41713 like 20113 but mat=417 rho=-5.656 u=417   $ ELEMENT D-17.2  S/N:3498
  41714 like 20114 but mat=417 rho=-5.656 u=417   $ ELEMENT D-17.3  S/N:3498
  41715 like 20115 but mat=417 rho=-5.656 u=417   $ ELEMENT D-17.4  S/N:3498
  41716 like 20116 but mat=417 rho=-5.656 u=417   $ ELEMENT D-17.5  S/N:3498
  41717 like 20117 but mat=417 rho=-5.656 u=417   $ ELEMENT D-17.6  S/N:3498
  41718 like 20118 but mat=417 rho=-5.656 u=417   $ ELEMENT D-17.7  S/N:3498
  41719 like 20119 but mat=417 rho=-5.656 u=417   $ ELEMENT D-17.8  S/N:3498
c ==============================================================================
  41801 like 20101 but u=418
  41802 like 20102 but u=418
  41803 like 20103 but u=418
  41804 like 20104 but u=418
  41805 like 20105 but u=418
  41806 like 20106 but u=418
  41807 like 20107 but u=418
  41808 like 20108 but u=418
  41809 like 20109 but u=418
  41810 like 20110 but u=418
  41811 like 20111 but u=418
  41812 like 20112 but mat=418 rho=-5.643 u=418   $ ELEMENT D-18.1  S/N:3336
  41813 like 20113 but mat=418 rho=-5.643 u=418   $ ELEMENT D-18.2  S/N:3336
  41814 like 20114 but mat=418 rho=-5.643 u=418   $ ELEMENT D-18.3  S/N:3336
  41815 like 20115 but mat=418 rho=-5.643 u=418   $ ELEMENT D-18.4  S/N:3336
  41816 like 20116 but mat=418 rho=-5.643 u=418   $ ELEMENT D-18.5  S/N:3336
  41817 like 20117 but mat=418 rho=-5.643 u=418   $ ELEMENT D-18.6  S/N:3336
  41818 like 20118 but mat=418 rho=-5.643 u=418   $ ELEMENT D-18.7  S/N:3336
  41819 like 20119 but mat=418 rho=-5.643 u=418   $ ELEMENT D-18.8  S/N:3336
c ==============================================================================
  50201 like 20101 but u=502
  50202 like 20102 but u=502
  50203 like 20103 but u=502
  50204 like 20104 but u=502
  50205 like 20105 but u=502
  50206 like 20106 but u=502
  50207 like 20107 but u=502
  50208 like 20108 but u=502
  50209 like 20109 but u=502
  50210 like 20110 but u=502
  50211 like 20111 but u=502
  50212 like 20112 but mat=502 rho=-5.687 u=502   $ ELEMENT E-2.1  S/N:2986
  50213 like 20113 but mat=502 rho=-5.687 u=502   $ ELEMENT E-2.2  S/N:2986
  50214 like 20114 but mat=502 rho=-5.687 u=502   $ ELEMENT E-2.3  S/N:2986
  50215 like 20115 but mat=502 rho=-5.687 u=502   $ ELEMENT E-2.4  S/N:2986
  50216 like 20116 but mat=502 rho=-5.687 u=502   $ ELEMENT E-2.5  S/N:2986
  50217 like 20117 but mat=502 rho=-5.687 u=502   $ ELEMENT E-2.6  S/N:2986
  50218 like 20118 but mat=502 rho=-5.687 u=502   $ ELEMENT E-2.7  S/N:2986
  50219 like 20119 but mat=502 rho=-5.687 u=502   $ ELEMENT E-2.8  S/N:2986
c ==============================================================================
  50301 like 20101 but u=503
  50302 like 20102 but u=503
  50303 like 20103 but u=503
  50304 like 20104 but u=503
  50305 like 20105 but u=503
  50306 like 20106 but u=503
  50307 like 20107 but u=503
  50308 like 20108 but u=503
  50309 like 20109 but u=503
  50310 like 20110 but u=503
  50311 like 20111 but u=503
  50312 like 20112 but mat=503 rho=-5.632 u=503   $ ELEMENT E-3.1  S/N:2458
  50313 like 20113 but mat=503 rho=-5.632 u=503   $ ELEMENT E-3.2  S/N:2458
  50314 like 20114 but mat=503 rho=-5.632 u=503   $ ELEMENT E-3.3  S/N:2458
  50315 like 20115 but mat=503 rho=-5.632 u=503   $ ELEMENT E-3.4  S/N:2458
  50316 like 20116 but mat=503 rho=-5.632 u=503   $ ELEMENT E-3.5  S/N:2458
  50317 like 20117 but mat=503 rho=-5.632 u=503   $ ELEMENT E-3.6  S/N:2458
  50318 like 20118 but mat=503 rho=-5.632 u=503   $ ELEMENT E-3.7  S/N:2458
  50319 like 20119 but mat=503 rho=-5.632 u=503   $ ELEMENT E-3.8  S/N:2458
c ==============================================================================
  50401 like 20101 but u=504
  50402 like 20102 but u=504
  50403 like 20103 but u=504
  50404 like 20104 but u=504
  50405 like 20105 but u=504
  50406 like 20106 but u=504
  50407 like 20107 but u=504
  50408 like 20108 but u=504
  50409 like 20109 but u=504
  50410 like 20110 but u=504
  50411 like 20111 but u=504
  50412 like 20112 but mat=504 rho=-5.642 u=504   $ ELEMENT E-4.1  S/N:3006
  50413 like 20113 but mat=504 rho=-5.642 u=504   $ ELEMENT E-4.2  S/N:3006
  50414 like 20114 but mat=504 rho=-5.642 u=504   $ ELEMENT E-4.3  S/N:3006
  50415 like 20115 but mat=504 rho=-5.642 u=504   $ ELEMENT E-4.4  S/N:3006
  50416 like 20116 but mat=504 rho=-5.642 u=504   $ ELEMENT E-4.5  S/N:3006
  50417 like 20117 but mat=504 rho=-5.642 u=504   $ ELEMENT E-4.6  S/N:3006
  50418 like 20118 but mat=504 rho=-5.642 u=504   $ ELEMENT E-4.7  S/N:3006
  50419 like 20119 but mat=504 rho=-5.642 u=504   $ ELEMENT E-4.8  S/N:3006
c ==============================================================================
  50501 like 20101 but u=505
  50502 like 20102 but u=505
  50503 like 20103 but u=505
  50504 like 20104 but u=505
  50505 like 20105 but u=505
  50506 like 20106 but u=505
  50507 like 20107 but u=505
  50508 like 20108 but u=505
  50509 like 20109 but u=505
  50510 like 20110 but u=505
  50511 like 20111 but u=505
  50512 like 20112 but mat=505 rho=-5.625 u=505   $ ELEMENT E-5.1  S/N:5014
  50513 like 20113 but mat=505 rho=-5.625 u=505   $ ELEMENT E-5.2  S/N:5014
  50514 like 20114 but mat=505 rho=-5.625 u=505   $ ELEMENT E-5.3  S/N:5014
  50515 like 20115 but mat=505 rho=-5.625 u=505   $ ELEMENT E-5.4  S/N:5014
  50516 like 20116 but mat=505 rho=-5.625 u=505   $ ELEMENT E-5.5  S/N:5014
  50517 like 20117 but mat=505 rho=-5.625 u=505   $ ELEMENT E-5.6  S/N:5014
  50518 like 20118 but mat=505 rho=-5.625 u=505   $ ELEMENT E-5.7  S/N:5014
  50519 like 20119 but mat=505 rho=-5.625 u=505   $ ELEMENT E-5.8  S/N:5014
c ==============================================================================
  50601 like 20101 but u=506
  50602 like 20102 but u=506
  50603 like 20103 but u=506
  50604 like 20104 but u=506
  50605 like 20105 but u=506
  50606 like 20106 but u=506
  50607 like 20107 but u=506
  50608 like 20108 but u=506
  50609 like 20109 but u=506
  50610 like 20110 but u=506
  50611 like 20111 but u=506
  50612 like 20112 but mat=506 rho=-5.627 u=506   $ ELEMENT E-6.1  S/N:4744
  50613 like 20113 but mat=506 rho=-5.627 u=506   $ ELEMENT E-6.2  S/N:4744
  50614 like 20114 but mat=506 rho=-5.627 u=506   $ ELEMENT E-6.3  S/N:4744
  50615 like 20115 but mat=506 rho=-5.627 u=506   $ ELEMENT E-6.4  S/N:4744
  50616 like 20116 but mat=506 rho=-5.627 u=506   $ ELEMENT E-6.5  S/N:4744
  50617 like 20117 but mat=506 rho=-5.627 u=506   $ ELEMENT E-6.6  S/N:4744
  50618 like 20118 but mat=506 rho=-5.627 u=506   $ ELEMENT E-6.7  S/N:4744
  50619 like 20119 but mat=506 rho=-5.627 u=506   $ ELEMENT E-6.8  S/N:4744
c ==============================================================================
  50701 like 20101 but u=507
  50702 like 20102 but u=507
  50703 like 20103 but u=507
  50704 like 20104 but u=507
  50705 like 20105 but u=507
  50706 like 20106 but u=507
  50707 like 20107 but u=507
  50708 like 20108 but u=507
  50709 like 20109 but u=507
  50710 like 20110 but u=507
  50711 like 20111 but u=507
  50712 like 20112 but mat=507 rho=-5.620 u=507   $ ELEMENT E-7.1  S/N:3147
  50713 like 20113 but mat=507 rho=-5.620 u=507   $ ELEMENT E-7.2  S/N:3147
  50714 like 20114 but mat=507 rho=-5.620 u=507   $ ELEMENT E-7.3  S/N:3147
  50715 like 20115 but mat=507 rho=-5.620 u=507   $ ELEMENT E-7.4  S/N:3147
  50716 like 20116 but mat=507 rho=-5.620 u=507   $ ELEMENT E-7.5  S/N:3147
  50717 like 20117 but mat=507 rho=-5.620 u=507   $ ELEMENT E-7.6  S/N:3147
  50718 like 20118 but mat=507 rho=-5.620 u=507   $ ELEMENT E-7.7  S/N:3147
  50719 like 20119 but mat=507 rho=-5.620 u=507   $ ELEMENT E-7.8  S/N:3147
c ==============================================================================
  50801 like 20101 but u=508
  50802 like 20102 but u=508
  50803 like 20103 but u=508
  50804 like 20104 but u=508
  50805 like 20105 but u=508
  50806 like 20106 but u=508
  50807 like 20107 but u=508
  50808 like 20108 but u=508
  50809 like 20109 but u=508
  50810 like 20110 but u=508
  50811 like 20111 but u=508
  50812 like 20112 but mat=508 rho=-5.624 u=508   $ ELEMENT E-8.1  S/N:4991
  50813 like 20113 but mat=508 rho=-5.624 u=508   $ ELEMENT E-8.2  S/N:4991
  50814 like 20114 but mat=508 rho=-5.624 u=508   $ ELEMENT E-8.3  S/N:4991
  50815 like 20115 but mat=508 rho=-5.624 u=508   $ ELEMENT E-8.4  S/N:4991
  50816 like 20116 but mat=508 rho=-5.624 u=508   $ ELEMENT E-8.5  S/N:4991
  50817 like 20117 but mat=508 rho=-5.624 u=508   $ ELEMENT E-8.6  S/N:4991
  50818 like 20118 but mat=508 rho=-5.624 u=508   $ ELEMENT E-8.7  S/N:4991
  50819 like 20119 but mat=508 rho=-5.624 u=508   $ ELEMENT E-8.8  S/N:4991
c ==============================================================================
  50901 like 20101 but u=509
  50902 like 20102 but u=509
  50903 like 20103 but u=509
  50904 like 20104 but u=509
  50905 like 20105 but u=509
  50906 like 20106 but u=509
  50907 like 20107 but u=509
  50908 like 20108 but u=509
  50909 like 20109 but u=509
  50910 like 20110 but u=509
  50911 like 20111 but u=509
  50912 like 20112 but mat=509 rho=-5.588 u=509   $ ELEMENT E-9.1  S/N:4742
  50913 like 20113 but mat=509 rho=-5.588 u=509   $ ELEMENT E-9.2  S/N:4742
  50914 like 20114 but mat=509 rho=-5.588 u=509   $ ELEMENT E-9.3  S/N:4742
  50915 like 20115 but mat=509 rho=-5.588 u=509   $ ELEMENT E-9.4  S/N:4742
  50916 like 20116 but mat=509 rho=-5.588 u=509   $ ELEMENT E-9.5  S/N:4742
  50917 like 20117 but mat=509 rho=-5.588 u=509   $ ELEMENT E-9.6  S/N:4742
  50918 like 20118 but mat=509 rho=-5.588 u=509   $ ELEMENT E-9.7  S/N:4742
  50919 like 20119 but mat=509 rho=-5.588 u=509   $ ELEMENT E-9.8  S/N:4742
c ==============================================================================
  51001 like 20101 but u=510
  51002 like 20102 but u=510
  51003 like 20103 but u=510
  51004 like 20104 but u=510
  51005 like 20105 but u=510
  51006 like 20106 but u=510
  51007 like 20107 but u=510
  51008 like 20108 but u=510
  51009 like 20109 but u=510
  51010 like 20110 but u=510
  51011 like 20111 but u=510
  51012 like 20112 but mat=510 rho=-5.617 u=510   $ ELEMENT E-10.1  S/N:4351
  51013 like 20113 but mat=510 rho=-5.617 u=510   $ ELEMENT E-10.2  S/N:4351
  51014 like 20114 but mat=510 rho=-5.617 u=510   $ ELEMENT E-10.3  S/N:4351
  51015 like 20115 but mat=510 rho=-5.617 u=510   $ ELEMENT E-10.4  S/N:4351
  51016 like 20116 but mat=510 rho=-5.617 u=510   $ ELEMENT E-10.5  S/N:4351
  51017 like 20117 but mat=510 rho=-5.617 u=510   $ ELEMENT E-10.6  S/N:4351
  51018 like 20118 but mat=510 rho=-5.617 u=510   $ ELEMENT E-10.7  S/N:4351
  51019 like 20119 but mat=510 rho=-5.617 u=510   $ ELEMENT E-10.8  S/N:4351
c ==============================================================================
  51101 like 20101 but u=511
  51102 like 20102 but u=511
  51103 like 20103 but u=511
  51104 like 20104 but u=511
  51105 like 20105 but u=511
  51106 like 20106 but u=511
  51107 like 20107 but u=511
  51108 like 20108 but u=511
  51109 like 20109 but u=511
  51110 like 20110 but u=511
  51111 like 20111 but u=511
  51112 like 20112 but mat=511 rho=-5.631 u=511   $ ELEMENT E-11.1  S/N:3107
  51113 like 20113 but mat=511 rho=-5.631 u=511   $ ELEMENT E-11.2  S/N:3107
  51114 like 20114 but mat=511 rho=-5.631 u=511   $ ELEMENT E-11.3  S/N:3107
  51115 like 20115 but mat=511 rho=-5.631 u=511   $ ELEMENT E-11.4  S/N:3107
  51116 like 20116 but mat=511 rho=-5.631 u=511   $ ELEMENT E-11.5  S/N:3107
  51117 like 20117 but mat=511 rho=-5.631 u=511   $ ELEMENT E-11.6  S/N:3107
  51118 like 20118 but mat=511 rho=-5.631 u=511   $ ELEMENT E-11.7  S/N:3107
  51119 like 20119 but mat=511 rho=-5.631 u=511   $ ELEMENT E-11.8  S/N:3107
c ==============================================================================
  51201 like 20101 but u=512
  51202 like 20102 but u=512
  51203 like 20103 but u=512
  51204 like 20104 but u=512
  51205 like 20105 but u=512
  51206 like 20106 but u=512
  51207 like 20107 but u=512
  51208 like 20108 but u=512
  51209 like 20109 but u=512
  51210 like 20110 but u=512
  51211 like 20111 but u=512
  51212 like 20112 but mat=512 rho=-5.656 u=512   $ ELEMENT E-12.1  S/N:3690
  51213 like 20113 but mat=512 rho=-5.656 u=512   $ ELEMENT E-12.2  S/N:3690
  51214 like 20114 but mat=512 rho=-5.656 u=512   $ ELEMENT E-12.3  S/N:3690
  51215 like 20115 but mat=512 rho=-5.656 u=512   $ ELEMENT E-12.4  S/N:3690
  51216 like 20116 but mat=512 rho=-5.656 u=512   $ ELEMENT E-12.5  S/N:3690
  51217 like 20117 but mat=512 rho=-5.656 u=512   $ ELEMENT E-12.6  S/N:3690
  51218 like 20118 but mat=512 rho=-5.656 u=512   $ ELEMENT E-12.7  S/N:3690
  51219 like 20119 but mat=512 rho=-5.656 u=512   $ ELEMENT E-12.8  S/N:3690
c ==============================================================================
  51301 like 20101 but u=513
  51302 like 20102 but u=513
  51303 like 20103 but u=513
  51304 like 20104 but u=513
  51305 like 20105 but u=513
  51306 like 20106 but u=513
  51307 like 20107 but u=513
  51308 like 20108 but u=513
  51309 like 20109 but u=513
  51310 like 20110 but u=513
  51311 like 20111 but u=513
  51312 like 20112 but mat=513 rho=-5.693 u=513   $ ELEMENT E-13.1  S/N:2987
  51313 like 20113 but mat=513 rho=-5.693 u=513   $ ELEMENT E-13.2  S/N:2987
  51314 like 20114 but mat=513 rho=-5.693 u=513   $ ELEMENT E-13.3  S/N:2987
  51315 like 20115 but mat=513 rho=-5.693 u=513   $ ELEMENT E-13.4  S/N:2987
  51316 like 20116 but mat=513 rho=-5.693 u=513   $ ELEMENT E-13.5  S/N:2987
  51317 like 20117 but mat=513 rho=-5.693 u=513   $ ELEMENT E-13.6  S/N:2987
  51318 like 20118 but mat=513 rho=-5.693 u=513   $ ELEMENT E-13.7  S/N:2987
  51319 like 20119 but mat=513 rho=-5.693 u=513   $ ELEMENT E-13.8  S/N:2987
c ==============================================================================
  51401 like 20101 but u=514
  51402 like 20102 but u=514
  51403 like 20103 but u=514
  51404 like 20104 but u=514
  51405 like 20105 but u=514
  51406 like 20106 but u=514
  51407 like 20107 but u=514
  51408 like 20108 but u=514
  51409 like 20109 but u=514
  51410 like 20110 but u=514
  51411 like 20111 but u=514
  51412 like 20112 but mat=514 rho=-5.636 u=514   $ ELEMENT E-14.1  S/N:3118
  51413 like 20113 but mat=514 rho=-5.636 u=514   $ ELEMENT E-14.2  S/N:3118
  51414 like 20114 but mat=514 rho=-5.636 u=514   $ ELEMENT E-14.3  S/N:3118
  51415 like 20115 but mat=514 rho=-5.636 u=514   $ ELEMENT E-14.4  S/N:3118
  51416 like 20116 but mat=514 rho=-5.636 u=514   $ ELEMENT E-14.5  S/N:3118
  51417 like 20117 but mat=514 rho=-5.636 u=514   $ ELEMENT E-14.6  S/N:3118
  51418 like 20118 but mat=514 rho=-5.636 u=514   $ ELEMENT E-14.7  S/N:3118
  51419 like 20119 but mat=514 rho=-5.636 u=514   $ ELEMENT E-14.8  S/N:3118
c ==============================================================================
  51501 like 20101 but u=515
  51502 like 20102 but u=515
  51503 like 20103 but u=515
  51504 like 20104 but u=515
  51505 like 20105 but u=515
  51506 like 20106 but u=515
  51507 like 20107 but u=515
  51508 like 20108 but u=515
  51509 like 20109 but u=515
  51510 like 20110 but u=515
  51511 like 20111 but u=515
  51512 like 20112 but mat=515 rho=-5.692 u=515   $ ELEMENT E-15.1  S/N:2934
  51513 like 20113 but mat=515 rho=-5.692 u=515   $ ELEMENT E-15.2  S/N:2934
  51514 like 20114 but mat=515 rho=-5.692 u=515   $ ELEMENT E-15.3  S/N:2934
  51515 like 20115 but mat=515 rho=-5.692 u=515   $ ELEMENT E-15.4  S/N:2934
  51516 like 20116 but mat=515 rho=-5.692 u=515   $ ELEMENT E-15.5  S/N:2934
  51517 like 20117 but mat=515 rho=-5.692 u=515   $ ELEMENT E-15.6  S/N:2934
  51518 like 20118 but mat=515 rho=-5.692 u=515   $ ELEMENT E-15.7  S/N:2934
  51519 like 20119 but mat=515 rho=-5.692 u=515   $ ELEMENT E-15.8  S/N:2934
c ==============================================================================
  51601 like 20101 but u=516
  51602 like 20102 but u=516
  51603 like 20103 but u=516
  51604 like 20104 but u=516
  51605 like 20105 but u=516
  51606 like 20106 but u=516
  51607 like 20107 but u=516
  51608 like 20108 but u=516
  51609 like 20109 but u=516
  51610 like 20110 but u=516
  51611 like 20111 but u=516
  51612 like 20112 but mat=516 rho=-5.619 u=516   $ ELEMENT E-16.1  S/N:4343
  51613 like 20113 but mat=516 rho=-5.619 u=516   $ ELEMENT E-16.2  S/N:4343
  51614 like 20114 but mat=516 rho=-5.619 u=516   $ ELEMENT E-16.3  S/N:4343
  51615 like 20115 but mat=516 rho=-5.619 u=516   $ ELEMENT E-16.4  S/N:4343
  51616 like 20116 but mat=516 rho=-5.619 u=516   $ ELEMENT E-16.5  S/N:4343
  51617 like 20117 but mat=516 rho=-5.619 u=516   $ ELEMENT E-16.6  S/N:4343
  51618 like 20118 but mat=516 rho=-5.619 u=516   $ ELEMENT E-16.7  S/N:4343
  51619 like 20119 but mat=516 rho=-5.619 u=516   $ ELEMENT E-16.8  S/N:4343
c ==============================================================================
  51701 like 20101 but u=517
  51702 like 20102 but u=517
  51703 like 20103 but u=517
  51704 like 20104 but u=517
  51705 like 20105 but u=517
  51706 like 20106 but u=517
  51707 like 20107 but u=517
  51708 like 20108 but u=517
  51709 like 20109 but u=517
  51710 like 20110 but u=517
  51711 like 20111 but u=517
  51712 like 20112 but mat=517 rho=-5.670 u=517   $ ELEMENT E-17.1  S/N:3517
  51713 like 20113 but mat=517 rho=-5.670 u=517   $ ELEMENT E-17.2  S/N:3517
  51714 like 20114 but mat=517 rho=-5.670 u=517   $ ELEMENT E-17.3  S/N:3517
  51715 like 20115 but mat=517 rho=-5.670 u=517   $ ELEMENT E-17.4  S/N:3517
  51716 like 20116 but mat=517 rho=-5.670 u=517   $ ELEMENT E-17.5  S/N:3517
  51717 like 20117 but mat=517 rho=-5.670 u=517   $ ELEMENT E-17.6  S/N:3517
  51718 like 20118 but mat=517 rho=-5.670 u=517   $ ELEMENT E-17.7  S/N:3517
  51719 like 20119 but mat=517 rho=-5.670 u=517   $ ELEMENT E-17.8  S/N:3517
c ==============================================================================
  51801 like 20101 but u=518
  51802 like 20102 but u=518
  51803 like 20103 but u=518
  51804 like 20104 but u=518
  51805 like 20105 but u=518
  51806 like 20106 but u=518
  51807 like 20107 but u=518
  51808 like 20108 but u=518
  51809 like 20109 but u=518
  51810 like 20110 but u=518
  51811 like 20111 but u=518
  51812 like 20112 but mat=518 rho=-5.658 u=518   $ ELEMENT E-18.1  S/N:3502
  51813 like 20113 but mat=518 rho=-5.658 u=518   $ ELEMENT E-18.2  S/N:3502
  51814 like 20114 but mat=518 rho=-5.658 u=518   $ ELEMENT E-18.3  S/N:3502
  51815 like 20115 but mat=518 rho=-5.658 u=518   $ ELEMENT E-18.4  S/N:3502
  51816 like 20116 but mat=518 rho=-5.658 u=518   $ ELEMENT E-18.5  S/N:3502
  51817 like 20117 but mat=518 rho=-5.658 u=518   $ ELEMENT E-18.6  S/N:3502
  51818 like 20118 but mat=518 rho=-5.658 u=518   $ ELEMENT E-18.7  S/N:3502
  51819 like 20119 but mat=518 rho=-5.658 u=518   $ ELEMENT E-18.8  S/N:3502
c ==============================================================================
  51901 like 20101 but u=519
  51902 like 20102 but u=519
  51903 like 20103 but u=519
  51904 like 20104 but u=519
  51905 like 20105 but u=519
  51906 like 20106 but u=519
  51907 like 20107 but u=519
  51908 like 20108 but u=519
  51909 like 20109 but u=519
  51910 like 20110 but u=519
  51911 like 20111 but u=519
  51912 like 20112 but mat=519 rho=-5.657 u=519   $ ELEMENT E-19.1  S/N:3503
  51913 like 20113 but mat=519 rho=-5.657 u=519   $ ELEMENT E-19.2  S/N:3503
  51914 like 20114 but mat=519 rho=-5.657 u=519   $ ELEMENT E-19.3  S/N:3503
  51915 like 20115 but mat=519 rho=-5.657 u=519   $ ELEMENT E-19.4  S/N:3503
  51916 like 20116 but mat=519 rho=-5.657 u=519   $ ELEMENT E-19.5  S/N:3503
  51917 like 20117 but mat=519 rho=-5.657 u=519   $ ELEMENT E-19.6  S/N:3503
  51918 like 20118 but mat=519 rho=-5.657 u=519   $ ELEMENT E-19.7  S/N:3503
  51919 like 20119 but mat=519 rho=-5.657 u=519   $ ELEMENT E-19.8  S/N:3503
c ==============================================================================
  52001 like 20101 but u=520
  52002 like 20102 but u=520
  52003 like 20103 but u=520
  52004 like 20104 but u=520
  52005 like 20105 but u=520
  52006 like 20106 but u=520
  52007 like 20107 but u=520
  52008 like 20108 but u=520
  52009 like 20109 but u=520
  52010 like 20110 but u=520
  52011 like 20111 but u=520
  52012 like 20112 but mat=520 rho=-5.649 u=520   $ ELEMENT E-20.1  S/N:3009
  52013 like 20113 but mat=520 rho=-5.649 u=520   $ ELEMENT E-20.2  S/N:3009
  52014 like 20114 but mat=520 rho=-5.649 u=520   $ ELEMENT E-20.3  S/N:3009
  52015 like 20115 but mat=520 rho=-5.649 u=520   $ ELEMENT E-20.4  S/N:3009
  52016 like 20116 but mat=520 rho=-5.649 u=520   $ ELEMENT E-20.5  S/N:3009
  52017 like 20117 but mat=520 rho=-5.649 u=520   $ ELEMENT E-20.6  S/N:3009
  52018 like 20118 but mat=520 rho=-5.649 u=520   $ ELEMENT E-20.7  S/N:3009
  52019 like 20119 but mat=520 rho=-5.649 u=520   $ ELEMENT E-20.8  S/N:3009
c ==============================================================================
  52101 like 20101 but u=521
  52102 like 20102 but u=521
  52103 like 20103 but u=521
  52104 like 20104 but u=521
  52105 like 20105 but u=521
  52106 like 20106 but u=521
  52107 like 20107 but u=521
  52108 like 20108 but u=521
  52109 like 20109 but u=521
  52110 like 20110 but u=521
  52111 like 20111 but u=521
  52112 like 20112 but mat=521 rho=-5.645 u=521   $ ELEMENT E-21.1  S/N:3011
  52113 like 20113 but mat=521 rho=-5.645 u=521   $ ELEMENT E-21.2  S/N:3011
  52114 like 20114 but mat=521 rho=-5.645 u=521   $ ELEMENT E-21.3  S/N:3011
  52115 like 20115 but mat=521 rho=-5.645 u=521   $ ELEMENT E-21.4  S/N:3011
  52116 like 20116 but mat=521 rho=-5.645 u=521   $ ELEMENT E-21.5  S/N:3011
  52117 like 20117 but mat=521 rho=-5.645 u=521   $ ELEMENT E-21.6  S/N:3011
  52118 like 20118 but mat=521 rho=-5.645 u=521   $ ELEMENT E-21.7  S/N:3011
  52119 like 20119 but mat=521 rho=-5.645 u=521   $ ELEMENT E-21.8  S/N:3011
c ==============================================================================
  52201 like 20101 but u=522
  52202 like 20102 but u=522
  52203 like 20103 but u=522
  52204 like 20104 but u=522
  52205 like 20105 but u=522
  52206 like 20106 but u=522
  52207 like 20107 but u=522
  52208 like 20108 but u=522
  52209 like 20109 but u=522
  52210 like 20110 but u=522
  52211 like 20111 but u=522
  52212 like 20112 but mat=522 rho=-5.646 u=522   $ ELEMENT E-22.1  S/N:3014
  52213 like 20113 but mat=522 rho=-5.646 u=522   $ ELEMENT E-22.2  S/N:3014
  52214 like 20114 but mat=522 rho=-5.646 u=522   $ ELEMENT E-22.3  S/N:3014
  52215 like 20115 but mat=522 rho=-5.646 u=522   $ ELEMENT E-22.4  S/N:3014
  52216 like 20116 but mat=522 rho=-5.646 u=522   $ ELEMENT E-22.5  S/N:3014
  52217 like 20117 but mat=522 rho=-5.646 u=522   $ ELEMENT E-22.6  S/N:3014
  52218 like 20118 but mat=522 rho=-5.646 u=522   $ ELEMENT E-22.7  S/N:3014
  52219 like 20119 but mat=522 rho=-5.646 u=522   $ ELEMENT E-22.8  S/N:3014
c ==============================================================================
  52301 like 20101 but u=523
  52302 like 20102 but u=523
  52303 like 20103 but u=523
  52304 like 20104 but u=523
  52305 like 20105 but u=523
  52306 like 20106 but u=523
  52307 like 20107 but u=523
  52308 like 20108 but u=523
  52309 like 20109 but u=523
  52310 like 20110 but u=523
  52311 like 20111 but u=523
  52312 like 20112 but mat=523 rho=-5.641 u=523   $ ELEMENT E-23.1  S/N:3008
  52313 like 20113 but mat=523 rho=-5.641 u=523   $ ELEMENT E-23.2  S/N:3008
  52314 like 20114 but mat=523 rho=-5.641 u=523   $ ELEMENT E-23.3  S/N:3008
  52315 like 20115 but mat=523 rho=-5.641 u=523   $ ELEMENT E-23.4  S/N:3008
  52316 like 20116 but mat=523 rho=-5.641 u=523   $ ELEMENT E-23.5  S/N:3008
  52317 like 20117 but mat=523 rho=-5.641 u=523   $ ELEMENT E-23.6  S/N:3008
  52318 like 20118 but mat=523 rho=-5.641 u=523   $ ELEMENT E-23.7  S/N:3008
  52319 like 20119 but mat=523 rho=-5.641 u=523   $ ELEMENT E-23.8  S/N:3008
c ==============================================================================
  52401 like 20101 but u=524
  52402 like 20102 but u=524
  52403 like 20103 but u=524
  52404 like 20104 but u=524
  52405 like 20105 but u=524
  52406 like 20106 but u=524
  52407 like 20107 but u=524
  52408 like 20108 but u=524
  52409 like 20109 but u=524
  52410 like 20110 but u=524
  52411 like 20111 but u=524
  52412 like 20112 but mat=524 rho=-5.636 u=524   $ ELEMENT E-24.1  S/N:3111
  52413 like 20113 but mat=524 rho=-5.636 u=524   $ ELEMENT E-24.2  S/N:3111
  52414 like 20114 but mat=524 rho=-5.636 u=524   $ ELEMENT E-24.3  S/N:3111
  52415 like 20115 but mat=524 rho=-5.636 u=524   $ ELEMENT E-24.4  S/N:3111
  52416 like 20116 but mat=524 rho=-5.636 u=524   $ ELEMENT E-24.5  S/N:3111
  52417 like 20117 but mat=524 rho=-5.636 u=524   $ ELEMENT E-24.6  S/N:3111
  52418 like 20118 but mat=524 rho=-5.636 u=524   $ ELEMENT E-24.7  S/N:3111
  52419 like 20119 but mat=524 rho=-5.636 u=524   $ ELEMENT E-24.8  S/N:3111
c ==============================================================================
  60101 like 20101 but u=601
  60102 like 20102 but u=601
  60103 like 20103 but u=601
  60104 like 20104 but u=601
  60105 like 20105 but u=601
  60106 like 20106 but u=601
  60107 like 20107 but u=601
  60108 like 20108 but u=601
  60109 like 20109 but u=601
  60110 like 20110 but u=601
  60111 like 20111 but u=601
  60112 like 20112 but mat=601 rho=-5.612 u=601   $ ELEMENT F-1.1  S/N:5017
  60113 like 20113 but mat=601 rho=-5.612 u=601   $ ELEMENT F-1.2  S/N:5017
  60114 like 20114 but mat=601 rho=-5.612 u=601   $ ELEMENT F-1.3  S/N:5017
  60115 like 20115 but mat=601 rho=-5.612 u=601   $ ELEMENT F-1.4  S/N:5017
  60116 like 20116 but mat=601 rho=-5.612 u=601   $ ELEMENT F-1.5  S/N:5017
  60117 like 20117 but mat=601 rho=-5.612 u=601   $ ELEMENT F-1.6  S/N:5017
  60118 like 20118 but mat=601 rho=-5.612 u=601   $ ELEMENT F-1.7  S/N:5017
  60119 like 20119 but mat=601 rho=-5.612 u=601   $ ELEMENT F-1.8  S/N:5017
c ==============================================================================
  60201 like 20101 but u=602
  60202 like 20102 but u=602
  60203 like 20103 but u=602
  60204 like 20104 but u=602
  60205 like 20105 but u=602
  60206 like 20106 but u=602
  60207 like 20107 but u=602
  60208 like 20108 but u=602
  60209 like 20109 but u=602
  60210 like 20110 but u=602
  60211 like 20111 but u=602
  60212 like 20112 but mat=602 rho=-5.613 u=602   $ ELEMENT F-2.1  S/N:5018
  60213 like 20113 but mat=602 rho=-5.613 u=602   $ ELEMENT F-2.2  S/N:5018
  60214 like 20114 but mat=602 rho=-5.613 u=602   $ ELEMENT F-2.3  S/N:5018
  60215 like 20115 but mat=602 rho=-5.613 u=602   $ ELEMENT F-2.4  S/N:5018
  60216 like 20116 but mat=602 rho=-5.613 u=602   $ ELEMENT F-2.5  S/N:5018
  60217 like 20117 but mat=602 rho=-5.613 u=602   $ ELEMENT F-2.6  S/N:5018
  60218 like 20118 but mat=602 rho=-5.613 u=602   $ ELEMENT F-2.7  S/N:5018
  60219 like 20119 but mat=602 rho=-5.613 u=602   $ ELEMENT F-2.8  S/N:5018
c ==============================================================================
  60301 like 20101 but u=603
  60302 like 20102 but u=603
  60303 like 20103 but u=603
  60304 like 20104 but u=603
  60305 like 20105 but u=603
  60306 like 20106 but u=603
  60307 like 20107 but u=603
  60308 like 20108 but u=603
  60309 like 20109 but u=603
  60310 like 20110 but u=603
  60311 like 20111 but u=603
  60312 like 20112 but mat=603 rho=-5.626 u=603   $ ELEMENT F-3.1  S/N:5027
  60313 like 20113 but mat=603 rho=-5.626 u=603   $ ELEMENT F-3.2  S/N:5027
  60314 like 20114 but mat=603 rho=-5.626 u=603   $ ELEMENT F-3.3  S/N:5027
  60315 like 20115 but mat=603 rho=-5.626 u=603   $ ELEMENT F-3.4  S/N:5027
  60316 like 20116 but mat=603 rho=-5.626 u=603   $ ELEMENT F-3.5  S/N:5027
  60317 like 20117 but mat=603 rho=-5.626 u=603   $ ELEMENT F-3.6  S/N:5027
  60318 like 20118 but mat=603 rho=-5.626 u=603   $ ELEMENT F-3.7  S/N:5027
  60319 like 20119 but mat=603 rho=-5.626 u=603   $ ELEMENT F-3.8  S/N:5027
c ==============================================================================
  60401 like 20101 but u=604
  60402 like 20102 but u=604
  60403 like 20103 but u=604
  60404 like 20104 but u=604
  60405 like 20105 but u=604
  60406 like 20106 but u=604
  60407 like 20107 but u=604
  60408 like 20108 but u=604
  60409 like 20109 but u=604
  60410 like 20110 but u=604
  60411 like 20111 but u=604
  60412 like 20112 but mat=604 rho=-5.613 u=604   $ ELEMENT F-4.1  S/N:5021
  60413 like 20113 but mat=604 rho=-5.613 u=604   $ ELEMENT F-4.2  S/N:5021
  60414 like 20114 but mat=604 rho=-5.613 u=604   $ ELEMENT F-4.3  S/N:5021
  60415 like 20115 but mat=604 rho=-5.613 u=604   $ ELEMENT F-4.4  S/N:5021
  60416 like 20116 but mat=604 rho=-5.613 u=604   $ ELEMENT F-4.5  S/N:5021
  60417 like 20117 but mat=604 rho=-5.613 u=604   $ ELEMENT F-4.6  S/N:5021
  60418 like 20118 but mat=604 rho=-5.613 u=604   $ ELEMENT F-4.7  S/N:5021
  60419 like 20119 but mat=604 rho=-5.613 u=604   $ ELEMENT F-4.8  S/N:5021
c ==============================================================================
  60501 like 20101 but u=605
  60502 like 20102 but u=605
  60503 like 20103 but u=605
  60504 like 20104 but u=605
  60505 like 20105 but u=605
  60506 like 20106 but u=605
  60507 like 20107 but u=605
  60508 like 20108 but u=605
  60509 like 20109 but u=605
  60510 like 20110 but u=605
  60511 like 20111 but u=605
  60512 like 20112 but mat=605 rho=-5.613 u=605   $ ELEMENT F-5.1  S/N:5026
  60513 like 20113 but mat=605 rho=-5.613 u=605   $ ELEMENT F-5.2  S/N:5026
  60514 like 20114 but mat=605 rho=-5.613 u=605   $ ELEMENT F-5.3  S/N:5026
  60515 like 20115 but mat=605 rho=-5.613 u=605   $ ELEMENT F-5.4  S/N:5026
  60516 like 20116 but mat=605 rho=-5.613 u=605   $ ELEMENT F-5.5  S/N:5026
  60517 like 20117 but mat=605 rho=-5.613 u=605   $ ELEMENT F-5.6  S/N:5026
  60518 like 20118 but mat=605 rho=-5.613 u=605   $ ELEMENT F-5.7  S/N:5026
  60519 like 20119 but mat=605 rho=-5.613 u=605   $ ELEMENT F-5.8  S/N:5026
c ==============================================================================
  60601 like 20101 but u=606
  60602 like 20102 but u=606
  60603 like 20103 but u=606
  60604 like 20104 but u=606
  60605 like 20105 but u=606
  60606 like 20106 but u=606
  60607 like 20107 but u=606
  60608 like 20108 but u=606
  60609 like 20109 but u=606
  60610 like 20110 but u=606
  60611 like 20111 but u=606
  60612 like 20112 but mat=606 rho=-5.697 u=606   $ ELEMENT F-6.1  S/N:6223
  60613 like 20113 but mat=606 rho=-5.697 u=606   $ ELEMENT F-6.2  S/N:6223
  60614 like 20114 but mat=606 rho=-5.697 u=606   $ ELEMENT F-6.3  S/N:6223
  60615 like 20115 but mat=606 rho=-5.697 u=606   $ ELEMENT F-6.4  S/N:6223
  60616 like 20116 but mat=606 rho=-5.697 u=606   $ ELEMENT F-6.5  S/N:6223
  60617 like 20117 but mat=606 rho=-5.697 u=606   $ ELEMENT F-6.6  S/N:6223
  60618 like 20118 but mat=606 rho=-5.697 u=606   $ ELEMENT F-6.7  S/N:6223
  60619 like 20119 but mat=606 rho=-5.697 u=606   $ ELEMENT F-6.8  S/N:6223
c ==============================================================================
  60701 like 20101 but u=607
  60702 like 20102 but u=607
  60703 like 20103 but u=607
  60704 like 20104 but u=607
  60705 like 20105 but u=607
  60706 like 20106 but u=607
  60707 like 20107 but u=607
  60708 like 20108 but u=607
  60709 like 20109 but u=607
  60710 like 20110 but u=607
  60711 like 20111 but u=607
  60712 like 20112 but mat=607 rho=-5.605 u=607   $ ELEMENT F-7.1  S/N:5256
  60713 like 20113 but mat=607 rho=-5.605 u=607   $ ELEMENT F-7.2  S/N:5256
  60714 like 20114 but mat=607 rho=-5.605 u=607   $ ELEMENT F-7.3  S/N:5256
  60715 like 20115 but mat=607 rho=-5.605 u=607   $ ELEMENT F-7.4  S/N:5256
  60716 like 20116 but mat=607 rho=-5.605 u=607   $ ELEMENT F-7.5  S/N:5256
  60717 like 20117 but mat=607 rho=-5.605 u=607   $ ELEMENT F-7.6  S/N:5256
  60718 like 20118 but mat=607 rho=-5.605 u=607   $ ELEMENT F-7.7  S/N:5256
  60719 like 20119 but mat=607 rho=-5.605 u=607   $ ELEMENT F-7.8  S/N:5256
c ==============================================================================
  60801 like 20101 but u=608
  60802 like 20102 but u=608
  60803 like 20103 but u=608
  60804 like 20104 but u=608
  60805 like 20105 but u=608
  60806 like 20106 but u=608
  60807 like 20107 but u=608
  60808 like 20108 but u=608
  60809 like 20109 but u=608
  60810 like 20110 but u=608
  60811 like 20111 but u=608
  60812 like 20112 but mat=608 rho=-5.613 u=608   $ ELEMENT F-8.1  S/N:5254
  60813 like 20113 but mat=608 rho=-5.613 u=608   $ ELEMENT F-8.2  S/N:5254
  60814 like 20114 but mat=608 rho=-5.613 u=608   $ ELEMENT F-8.3  S/N:5254
  60815 like 20115 but mat=608 rho=-5.613 u=608   $ ELEMENT F-8.4  S/N:5254
  60816 like 20116 but mat=608 rho=-5.613 u=608   $ ELEMENT F-8.5  S/N:5254
  60817 like 20117 but mat=608 rho=-5.613 u=608   $ ELEMENT F-8.6  S/N:5254
  60818 like 20118 but mat=608 rho=-5.613 u=608   $ ELEMENT F-8.7  S/N:5254
  60819 like 20119 but mat=608 rho=-5.613 u=608   $ ELEMENT F-8.8  S/N:5254
c ==============================================================================
  60901 like 20101 but u=609
  60902 like 20102 but u=609
  60903 like 20103 but u=609
  60904 like 20104 but u=609
  60905 like 20105 but u=609
  60906 like 20106 but u=609
  60907 like 20107 but u=609
  60908 like 20108 but u=609
  60909 like 20109 but u=609
  60910 like 20110 but u=609
  60911 like 20111 but u=609
  60912 like 20112 but mat=609 rho=-5.613 u=609   $ ELEMENT F-9.1  S/N:5031
  60913 like 20113 but mat=609 rho=-5.613 u=609   $ ELEMENT F-9.2  S/N:5031
  60914 like 20114 but mat=609 rho=-5.613 u=609   $ ELEMENT F-9.3  S/N:5031
  60915 like 20115 but mat=609 rho=-5.613 u=609   $ ELEMENT F-9.4  S/N:5031
  60916 like 20116 but mat=609 rho=-5.613 u=609   $ ELEMENT F-9.5  S/N:5031
  60917 like 20117 but mat=609 rho=-5.613 u=609   $ ELEMENT F-9.6  S/N:5031
  60918 like 20118 but mat=609 rho=-5.613 u=609   $ ELEMENT F-9.7  S/N:5031
  60919 like 20119 but mat=609 rho=-5.613 u=609   $ ELEMENT F-9.8  S/N:5031
c ==============================================================================
  61101 like 20101 but u=611
  61102 like 20102 but u=611
  61103 like 20103 but u=611
  61104 like 20104 but u=611
  61105 like 20105 but u=611
  61106 like 20106 but u=611
  61107 like 20107 but u=611
  61108 like 20108 but u=611
  61109 like 20109 but u=611
  61110 like 20110 but u=611
  61111 like 20111 but u=611
  61112 like 20112 but mat=611 rho=-5.599 u=611   $ ELEMENT F-11.1  S/N:5949
  61113 like 20113 but mat=611 rho=-5.599 u=611   $ ELEMENT F-11.2  S/N:5949
  61114 like 20114 but mat=611 rho=-5.599 u=611   $ ELEMENT F-11.3  S/N:5949
  61115 like 20115 but mat=611 rho=-5.599 u=611   $ ELEMENT F-11.4  S/N:5949
  61116 like 20116 but mat=611 rho=-5.599 u=611   $ ELEMENT F-11.5  S/N:5949
  61117 like 20117 but mat=611 rho=-5.599 u=611   $ ELEMENT F-11.6  S/N:5949
  61118 like 20118 but mat=611 rho=-5.599 u=611   $ ELEMENT F-11.7  S/N:5949
  61119 like 20119 but mat=611 rho=-5.599 u=611   $ ELEMENT F-11.8  S/N:5949
c ==============================================================================
  61201 like 20101 but u=612
  61202 like 20102 but u=612
  61203 like 20103 but u=612
  61204 like 20104 but u=612
  61205 like 20105 but u=612
  61206 like 20106 but u=612
  61207 like 20107 but u=612
  61208 like 20108 but u=612
  61209 like 20109 but u=612
  61210 like 20110 but u=612
  61211 like 20111 but u=612
  61212 like 20112 but mat=612 rho=-5.703 u=612   $ ELEMENT F-12.1  S/N:2900
  61213 like 20113 but mat=612 rho=-5.703 u=612   $ ELEMENT F-12.2  S/N:2900
  61214 like 20114 but mat=612 rho=-5.703 u=612   $ ELEMENT F-12.3  S/N:2900
  61215 like 20115 but mat=612 rho=-5.703 u=612   $ ELEMENT F-12.4  S/N:2900
  61216 like 20116 but mat=612 rho=-5.703 u=612   $ ELEMENT F-12.5  S/N:2900
  61217 like 20117 but mat=612 rho=-5.703 u=612   $ ELEMENT F-12.6  S/N:2900
  61218 like 20118 but mat=612 rho=-5.703 u=612   $ ELEMENT F-12.7  S/N:2900
  61219 like 20119 but mat=612 rho=-5.703 u=612   $ ELEMENT F-12.8  S/N:2900
c ==============================================================================
  61301 like 20101 but u=613
  61302 like 20102 but u=613
  61303 like 20103 but u=613
  61304 like 20104 but u=613
  61305 like 20105 but u=613
  61306 like 20106 but u=613
  61307 like 20107 but u=613
  61308 like 20108 but u=613
  61309 like 20109 but u=613
  61310 like 20110 but u=613
  61311 like 20111 but u=613
  61312 like 20112 but mat=613 rho=-5.625 u=613   $ ELEMENT F-13.1  S/N:4339
  61313 like 20113 but mat=613 rho=-5.625 u=613   $ ELEMENT F-13.2  S/N:4339
  61314 like 20114 but mat=613 rho=-5.625 u=613   $ ELEMENT F-13.3  S/N:4339
  61315 like 20115 but mat=613 rho=-5.625 u=613   $ ELEMENT F-13.4  S/N:4339
  61316 like 20116 but mat=613 rho=-5.625 u=613   $ ELEMENT F-13.5  S/N:4339
  61317 like 20117 but mat=613 rho=-5.625 u=613   $ ELEMENT F-13.6  S/N:4339
  61318 like 20118 but mat=613 rho=-5.625 u=613   $ ELEMENT F-13.7  S/N:4339
  61319 like 20119 but mat=613 rho=-5.625 u=613   $ ELEMENT F-13.8  S/N:4339
c ==============================================================================
  61401 like 20101 but u=614
  61402 like 20102 but u=614
  61403 like 20103 but u=614
  61404 like 20104 but u=614
  61405 like 20105 but u=614
  61406 like 20106 but u=614
  61407 like 20107 but u=614
  61408 like 20108 but u=614
  61409 like 20109 but u=614
  61410 like 20110 but u=614
  61411 like 20111 but u=614
  61412 like 20112 but mat=614 rho=-5.600 u=614   $ ELEMENT F-14.1  S/N:5653
  61413 like 20113 but mat=614 rho=-5.600 u=614   $ ELEMENT F-14.2  S/N:5653
  61414 like 20114 but mat=614 rho=-5.600 u=614   $ ELEMENT F-14.3  S/N:5653
  61415 like 20115 but mat=614 rho=-5.600 u=614   $ ELEMENT F-14.4  S/N:5653
  61416 like 20116 but mat=614 rho=-5.600 u=614   $ ELEMENT F-14.5  S/N:5653
  61417 like 20117 but mat=614 rho=-5.600 u=614   $ ELEMENT F-14.6  S/N:5653
  61418 like 20118 but mat=614 rho=-5.600 u=614   $ ELEMENT F-14.7  S/N:5653
  61419 like 20119 but mat=614 rho=-5.600 u=614   $ ELEMENT F-14.8  S/N:5653
c ==============================================================================
  61501 like 20101 but u=615
  61502 like 20102 but u=615
  61503 like 20103 but u=615
  61504 like 20104 but u=615
  61505 like 20105 but u=615
  61506 like 20106 but u=615
  61507 like 20107 but u=615
  61508 like 20108 but u=615
  61509 like 20109 but u=615
  61510 like 20110 but u=615
  61511 like 20111 but u=615
  61512 like 20112 but mat=615 rho=-5.606 u=615   $ ELEMENT F-15.1  S/N:5654
  61513 like 20113 but mat=615 rho=-5.606 u=615   $ ELEMENT F-15.2  S/N:5654
  61514 like 20114 but mat=615 rho=-5.606 u=615   $ ELEMENT F-15.3  S/N:5654
  61515 like 20115 but mat=615 rho=-5.606 u=615   $ ELEMENT F-15.4  S/N:5654
  61516 like 20116 but mat=615 rho=-5.606 u=615   $ ELEMENT F-15.5  S/N:5654
  61517 like 20117 but mat=615 rho=-5.606 u=615   $ ELEMENT F-15.6  S/N:5654
  61518 like 20118 but mat=615 rho=-5.606 u=615   $ ELEMENT F-15.7  S/N:5654
  61519 like 20119 but mat=615 rho=-5.606 u=615   $ ELEMENT F-15.8  S/N:5654
c ==============================================================================
  61601 like 20101 but u=616
  61602 like 20102 but u=616
  61603 like 20103 but u=616
  61604 like 20104 but u=616
  61605 like 20105 but u=616
  61606 like 20106 but u=616
  61607 like 20107 but u=616
  61608 like 20108 but u=616
  61609 like 20109 but u=616
  61610 like 20110 but u=616
  61611 like 20111 but u=616
  61612 like 20112 but mat=616 rho=-5.599 u=616   $ ELEMENT F-16.1  S/N:5655
  61613 like 20113 but mat=616 rho=-5.599 u=616   $ ELEMENT F-16.2  S/N:5655
  61614 like 20114 but mat=616 rho=-5.599 u=616   $ ELEMENT F-16.3  S/N:5655
  61615 like 20115 but mat=616 rho=-5.599 u=616   $ ELEMENT F-16.4  S/N:5655
  61616 like 20116 but mat=616 rho=-5.599 u=616   $ ELEMENT F-16.5  S/N:5655
  61617 like 20117 but mat=616 rho=-5.599 u=616   $ ELEMENT F-16.6  S/N:5655
  61618 like 20118 but mat=616 rho=-5.599 u=616   $ ELEMENT F-16.7  S/N:5655
  61619 like 20119 but mat=616 rho=-5.599 u=616   $ ELEMENT F-16.8  S/N:5655
c ==============================================================================
  61701 like 20101 but u=617
  61702 like 20102 but u=617
  61703 like 20103 but u=617
  61704 like 20104 but u=617
  61705 like 20105 but u=617
  61706 like 20106 but u=617
  61707 like 20107 but u=617
  61708 like 20108 but u=617
  61709 like 20109 but u=617
  61710 like 20110 but u=617
  61711 like 20111 but u=617
  61712 like 20112 but mat=617 rho=-5.596 u=617   $ ELEMENT F-17.1  S/N:5939
  61713 like 20113 but mat=617 rho=-5.596 u=617   $ ELEMENT F-17.2  S/N:5939
  61714 like 20114 but mat=617 rho=-5.596 u=617   $ ELEMENT F-17.3  S/N:5939
  61715 like 20115 but mat=617 rho=-5.596 u=617   $ ELEMENT F-17.4  S/N:5939
  61716 like 20116 but mat=617 rho=-5.596 u=617   $ ELEMENT F-17.5  S/N:5939
  61717 like 20117 but mat=617 rho=-5.596 u=617   $ ELEMENT F-17.6  S/N:5939
  61718 like 20118 but mat=617 rho=-5.596 u=617   $ ELEMENT F-17.7  S/N:5939
  61719 like 20119 but mat=617 rho=-5.596 u=617   $ ELEMENT F-17.8  S/N:5939
c ==============================================================================
  61801 like 20101 but u=618
  61802 like 20102 but u=618
  61803 like 20103 but u=618
  61804 like 20104 but u=618
  61805 like 20105 but u=618
  61806 like 20106 but u=618
  61807 like 20107 but u=618
  61808 like 20108 but u=618
  61809 like 20109 but u=618
  61810 like 20110 but u=618
  61811 like 20111 but u=618
  61812 like 20112 but mat=618 rho=-5.599 u=618   $ ELEMENT F-18.1  S/N:5946
  61813 like 20113 but mat=618 rho=-5.599 u=618   $ ELEMENT F-18.2  S/N:5946
  61814 like 20114 but mat=618 rho=-5.599 u=618   $ ELEMENT F-18.3  S/N:5946
  61815 like 20115 but mat=618 rho=-5.599 u=618   $ ELEMENT F-18.4  S/N:5946
  61816 like 20116 but mat=618 rho=-5.599 u=618   $ ELEMENT F-18.5  S/N:5946
  61817 like 20117 but mat=618 rho=-5.599 u=618   $ ELEMENT F-18.6  S/N:5946
  61818 like 20118 but mat=618 rho=-5.599 u=618   $ ELEMENT F-18.7  S/N:5946
  61819 like 20119 but mat=618 rho=-5.599 u=618   $ ELEMENT F-18.8  S/N:5946
c ==============================================================================
  61901 like 20101 but u=619
  61902 like 20102 but u=619
  61903 like 20103 but u=619
  61904 like 20104 but u=619
  61905 like 20105 but u=619
  61906 like 20106 but u=619
  61907 like 20107 but u=619
  61908 like 20108 but u=619
  61909 like 20109 but u=619
  61910 like 20110 but u=619
  61911 like 20111 but u=619
  61912 like 20112 but mat=619 rho=-5.634 u=619   $ ELEMENT F-19.1  S/N:3113
  61913 like 20113 but mat=619 rho=-5.634 u=619   $ ELEMENT F-19.2  S/N:3113
  61914 like 20114 but mat=619 rho=-5.634 u=619   $ ELEMENT F-19.3  S/N:3113
  61915 like 20115 but mat=619 rho=-5.634 u=619   $ ELEMENT F-19.4  S/N:3113
  61916 like 20116 but mat=619 rho=-5.634 u=619   $ ELEMENT F-19.5  S/N:3113
  61917 like 20117 but mat=619 rho=-5.634 u=619   $ ELEMENT F-19.6  S/N:3113
  61918 like 20118 but mat=619 rho=-5.634 u=619   $ ELEMENT F-19.7  S/N:3113
  61919 like 20119 but mat=619 rho=-5.634 u=619   $ ELEMENT F-19.8  S/N:3113
c ==============================================================================
  62001 like 20101 but u=620
  62002 like 20102 but u=620
  62003 like 20103 but u=620
  62004 like 20104 but u=620
  62005 like 20105 but u=620
  62006 like 20106 but u=620
  62007 like 20107 but u=620
  62008 like 20108 but u=620
  62009 like 20109 but u=620
  62010 like 20110 but u=620
  62011 like 20111 but u=620
  62012 like 20112 but mat=620 rho=-5.691 u=620   $ ELEMENT F-20.1  S/N:2949
  62013 like 20113 but mat=620 rho=-5.691 u=620   $ ELEMENT F-20.2  S/N:2949
  62014 like 20114 but mat=620 rho=-5.691 u=620   $ ELEMENT F-20.3  S/N:2949
  62015 like 20115 but mat=620 rho=-5.691 u=620   $ ELEMENT F-20.4  S/N:2949
  62016 like 20116 but mat=620 rho=-5.691 u=620   $ ELEMENT F-20.5  S/N:2949
  62017 like 20117 but mat=620 rho=-5.691 u=620   $ ELEMENT F-20.6  S/N:2949
  62018 like 20118 but mat=620 rho=-5.691 u=620   $ ELEMENT F-20.7  S/N:2949
  62019 like 20119 but mat=620 rho=-5.691 u=620   $ ELEMENT F-20.8  S/N:2949
c ==============================================================================
  62101 like 20101 but u=621
  62102 like 20102 but u=621
  62103 like 20103 but u=621
  62104 like 20104 but u=621
  62105 like 20105 but u=621
  62106 like 20106 but u=621
  62107 like 20107 but u=621
  62108 like 20108 but u=621
  62109 like 20109 but u=621
  62110 like 20110 but u=621
  62111 like 20111 but u=621
  62112 like 20112 but mat=621 rho=-5.612 u=621   $ ELEMENT F-21.1  S/N:5649
  62113 like 20113 but mat=621 rho=-5.612 u=621   $ ELEMENT F-21.2  S/N:5649
  62114 like 20114 but mat=621 rho=-5.612 u=621   $ ELEMENT F-21.3  S/N:5649
  62115 like 20115 but mat=621 rho=-5.612 u=621   $ ELEMENT F-21.4  S/N:5649
  62116 like 20116 but mat=621 rho=-5.612 u=621   $ ELEMENT F-21.5  S/N:5649
  62117 like 20117 but mat=621 rho=-5.612 u=621   $ ELEMENT F-21.6  S/N:5649
  62118 like 20118 but mat=621 rho=-5.612 u=621   $ ELEMENT F-21.7  S/N:5649
  62119 like 20119 but mat=621 rho=-5.612 u=621   $ ELEMENT F-21.8  S/N:5649
c ==============================================================================
  62201 like 20101 but u=622
  62202 like 20102 but u=622
  62203 like 20103 but u=622
  62204 like 20104 but u=622
  62205 like 20105 but u=622
  62206 like 20106 but u=622
  62207 like 20107 but u=622
  62208 like 20108 but u=622
  62209 like 20109 but u=622
  62210 like 20110 but u=622
  62211 like 20111 but u=622
  62212 like 20112 but mat=622 rho=-5.670 u=622   $ ELEMENT F-22.1  S/N:2917
  62213 like 20113 but mat=622 rho=-5.670 u=622   $ ELEMENT F-22.2  S/N:2917
  62214 like 20114 but mat=622 rho=-5.670 u=622   $ ELEMENT F-22.3  S/N:2917
  62215 like 20115 but mat=622 rho=-5.670 u=622   $ ELEMENT F-22.4  S/N:2917
  62216 like 20116 but mat=622 rho=-5.670 u=622   $ ELEMENT F-22.5  S/N:2917
  62217 like 20117 but mat=622 rho=-5.670 u=622   $ ELEMENT F-22.6  S/N:2917
  62218 like 20118 but mat=622 rho=-5.670 u=622   $ ELEMENT F-22.7  S/N:2917
  62219 like 20119 but mat=622 rho=-5.670 u=622   $ ELEMENT F-22.8  S/N:2917
c ==============================================================================
  62301 like 20101 but u=623
  62302 like 20102 but u=623
  62303 like 20103 but u=623
  62304 like 20104 but u=623
  62305 like 20105 but u=623
  62306 like 20106 but u=623
  62307 like 20107 but u=623
  62308 like 20108 but u=623
  62309 like 20109 but u=623
  62310 like 20110 but u=623
  62311 like 20111 but u=623
  62312 like 20112 but mat=623 rho=-5.599 u=623   $ ELEMENT F-23.1  S/N:5000
  62313 like 20113 but mat=623 rho=-5.599 u=623   $ ELEMENT F-23.2  S/N:5000
  62314 like 20114 but mat=623 rho=-5.599 u=623   $ ELEMENT F-23.3  S/N:5000
  62315 like 20115 but mat=623 rho=-5.599 u=623   $ ELEMENT F-23.4  S/N:5000
  62316 like 20116 but mat=623 rho=-5.599 u=623   $ ELEMENT F-23.5  S/N:5000
  62317 like 20117 but mat=623 rho=-5.599 u=623   $ ELEMENT F-23.6  S/N:5000
  62318 like 20118 but mat=623 rho=-5.599 u=623   $ ELEMENT F-23.7  S/N:5000
  62319 like 20119 but mat=623 rho=-5.599 u=623   $ ELEMENT F-23.8  S/N:5000
c ==============================================================================
  62401 like 20101 but u=624
  62402 like 20102 but u=624
  62403 like 20103 but u=624
  62404 like 20104 but u=624
  62405 like 20105 but u=624
  62406 like 20106 but u=624
  62407 like 20107 but u=624
  62408 like 20108 but u=624
  62409 like 20109 but u=624
  62410 like 20110 but u=624
  62411 like 20111 but u=624
  62412 like 20112 but mat=624 rho=-5.596 u=624   $ ELEMENT F-24.1  S/N:5948
  62413 like 20113 but mat=624 rho=-5.596 u=624   $ ELEMENT F-24.2  S/N:5948
  62414 like 20114 but mat=624 rho=-5.596 u=624   $ ELEMENT F-24.3  S/N:5948
  62415 like 20115 but mat=624 rho=-5.596 u=624   $ ELEMENT F-24.4  S/N:5948
  62416 like 20116 but mat=624 rho=-5.596 u=624   $ ELEMENT F-24.5  S/N:5948
  62417 like 20117 but mat=624 rho=-5.596 u=624   $ ELEMENT F-24.6  S/N:5948
  62418 like 20118 but mat=624 rho=-5.596 u=624   $ ELEMENT F-24.7  S/N:5948
  62419 like 20119 but mat=624 rho=-5.596 u=624   $ ELEMENT F-24.8  S/N:5948
c ==============================================================================
  62501 like 20101 but u=625
  62502 like 20102 but u=625
  62503 like 20103 but u=625
  62504 like 20104 but u=625
  62505 like 20105 but u=625
  62506 like 20106 but u=625
  62507 like 20107 but u=625
  62508 like 20108 but u=625
  62509 like 20109 but u=625
  62510 like 20110 but u=625
  62511 like 20111 but u=625
  62512 like 20112 but mat=625 rho=-5.603 u=625   $ ELEMENT F-25.1  S/N:5022
  62513 like 20113 but mat=625 rho=-5.603 u=625   $ ELEMENT F-25.2  S/N:5022
  62514 like 20114 but mat=625 rho=-5.603 u=625   $ ELEMENT F-25.3  S/N:5022
  62515 like 20115 but mat=625 rho=-5.603 u=625   $ ELEMENT F-25.4  S/N:5022
  62516 like 20116 but mat=625 rho=-5.603 u=625   $ ELEMENT F-25.5  S/N:5022
  62517 like 20117 but mat=625 rho=-5.603 u=625   $ ELEMENT F-25.6  S/N:5022
  62518 like 20118 but mat=625 rho=-5.603 u=625   $ ELEMENT F-25.7  S/N:5022
  62519 like 20119 but mat=625 rho=-5.603 u=625   $ ELEMENT F-25.8  S/N:5022
c ==============================================================================
  62601 like 20101 but u=626
  62602 like 20102 but u=626
  62603 like 20103 but u=626
  62604 like 20104 but u=626
  62605 like 20105 but u=626
  62606 like 20106 but u=626
  62607 like 20107 but u=626
  62608 like 20108 but u=626
  62609 like 20109 but u=626
  62610 like 20110 but u=626
  62611 like 20111 but u=626
  62612 like 20112 but mat=626 rho=-5.701 u=626   $ ELEMENT F-26.1  S/N:2907
  62613 like 20113 but mat=626 rho=-5.701 u=626   $ ELEMENT F-26.2  S/N:2907
  62614 like 20114 but mat=626 rho=-5.701 u=626   $ ELEMENT F-26.3  S/N:2907
  62615 like 20115 but mat=626 rho=-5.701 u=626   $ ELEMENT F-26.4  S/N:2907
  62616 like 20116 but mat=626 rho=-5.701 u=626   $ ELEMENT F-26.5  S/N:2907
  62617 like 20117 but mat=626 rho=-5.701 u=626   $ ELEMENT F-26.6  S/N:2907
  62618 like 20118 but mat=626 rho=-5.701 u=626   $ ELEMENT F-26.7  S/N:2907
  62619 like 20119 but mat=626 rho=-5.701 u=626   $ ELEMENT F-26.8  S/N:2907
c ==============================================================================
  62701 like 20101 but u=627
  62702 like 20102 but u=627
  62703 like 20103 but u=627
  62704 like 20104 but u=627
  62705 like 20105 but u=627
  62706 like 20106 but u=627
  62707 like 20107 but u=627
  62708 like 20108 but u=627
  62709 like 20109 but u=627
  62710 like 20110 but u=627
  62711 like 20111 but u=627
  62712 like 20112 but mat=627 rho=-5.609 u=627   $ ELEMENT F-27.1  S/N:5944
  62713 like 20113 but mat=627 rho=-5.609 u=627   $ ELEMENT F-27.2  S/N:5944
  62714 like 20114 but mat=627 rho=-5.609 u=627   $ ELEMENT F-27.3  S/N:5944
  62715 like 20115 but mat=627 rho=-5.609 u=627   $ ELEMENT F-27.4  S/N:5944
  62716 like 20116 but mat=627 rho=-5.609 u=627   $ ELEMENT F-27.5  S/N:5944
  62717 like 20117 but mat=627 rho=-5.609 u=627   $ ELEMENT F-27.6  S/N:5944
  62718 like 20118 but mat=627 rho=-5.609 u=627   $ ELEMENT F-27.7  S/N:5944
  62719 like 20119 but mat=627 rho=-5.609 u=627   $ ELEMENT F-27.8  S/N:5944
c ==============================================================================
  62801 like 20101 but u=628
  62802 like 20102 but u=628
  62803 like 20103 but u=628
  62804 like 20104 but u=628
  62805 like 20105 but u=628
  62806 like 20106 but u=628
  62807 like 20107 but u=628
  62808 like 20108 but u=628
  62809 like 20109 but u=628
  62810 like 20110 but u=628
  62811 like 20111 but u=628
  62812 like 20112 but mat=628 rho=-5.638 u=628   $ ELEMENT F-28.1  S/N:3326
  62813 like 20113 but mat=628 rho=-5.638 u=628   $ ELEMENT F-28.2  S/N:3326
  62814 like 20114 but mat=628 rho=-5.638 u=628   $ ELEMENT F-28.3  S/N:3326
  62815 like 20115 but mat=628 rho=-5.638 u=628   $ ELEMENT F-28.4  S/N:3326
  62816 like 20116 but mat=628 rho=-5.638 u=628   $ ELEMENT F-28.5  S/N:3326
  62817 like 20117 but mat=628 rho=-5.638 u=628   $ ELEMENT F-28.6  S/N:3326
  62818 like 20118 but mat=628 rho=-5.638 u=628   $ ELEMENT F-28.7  S/N:3326
  62819 like 20119 but mat=628 rho=-5.638 u=628   $ ELEMENT F-28.8  S/N:3326
c ==============================================================================
  62901 like 20101 but u=629
  62902 like 20102 but u=629
  62903 like 20103 but u=629
  62904 like 20104 but u=629
  62905 like 20105 but u=629
  62906 like 20106 but u=629
  62907 like 20107 but u=629
  62908 like 20108 but u=629
  62909 like 20109 but u=629
  62910 like 20110 but u=629
  62911 like 20111 but u=629
  62912 like 20112 but mat=629 rho=-5.682 u=629   $ ELEMENT F-29.1  S/N:2914
  62913 like 20113 but mat=629 rho=-5.682 u=629   $ ELEMENT F-29.2  S/N:2914
  62914 like 20114 but mat=629 rho=-5.682 u=629   $ ELEMENT F-29.3  S/N:2914
  62915 like 20115 but mat=629 rho=-5.682 u=629   $ ELEMENT F-29.4  S/N:2914
  62916 like 20116 but mat=629 rho=-5.682 u=629   $ ELEMENT F-29.5  S/N:2914
  62917 like 20117 but mat=629 rho=-5.682 u=629   $ ELEMENT F-29.6  S/N:2914
  62918 like 20118 but mat=629 rho=-5.682 u=629   $ ELEMENT F-29.7  S/N:2914
  62919 like 20119 but mat=629 rho=-5.682 u=629   $ ELEMENT F-29.8  S/N:2914
c ==============================================================================
  63001 like 20101 but u=630
  63002 like 20102 but u=630
  63003 like 20103 but u=630
  63004 like 20104 but u=630
  63005 like 20105 but u=630
  63006 like 20106 but u=630
  63007 like 20107 but u=630
  63008 like 20108 but u=630
  63009 like 20109 but u=630
  63010 like 20110 but u=630
  63011 like 20111 but u=630
  63012 like 20112 but mat=630 rho=-5.681 u=630   $ ELEMENT F-30.1  S/N:2909
  63013 like 20113 but mat=630 rho=-5.681 u=630   $ ELEMENT F-30.2  S/N:2909
  63014 like 20114 but mat=630 rho=-5.681 u=630   $ ELEMENT F-30.3  S/N:2909
  63015 like 20115 but mat=630 rho=-5.681 u=630   $ ELEMENT F-30.4  S/N:2909
  63016 like 20116 but mat=630 rho=-5.681 u=630   $ ELEMENT F-30.5  S/N:2909
  63017 like 20117 but mat=630 rho=-5.681 u=630   $ ELEMENT F-30.6  S/N:2909
  63018 like 20118 but mat=630 rho=-5.681 u=630   $ ELEMENT F-30.7  S/N:2909
  63019 like 20119 but mat=630 rho=-5.681 u=630   $ ELEMENT F-30.8  S/N:2909
c ==============================================================================
c ** RABBIT: UNIVERSE = [2]
  145     7  -2.699   (25 -12):(12 219):(-25 -45) u=2 $ Not tube
  146     3  -0.001239 12 -219                    u=2 $ air
  147     6  -1        #145 #146                  u=2 $water
c ** GRAPHITE ROD: UNIVERSE = [3]
  160     6      -1 -21 201              u=3 $ Water around lower pin
  161     9    -7.9 -21 -201             u=3 $ Bottom pin
  162     9    -7.9 -14 21               u=3 $ BOTTOM SS cap
  163     9    -7.9 14 -4 202            u=3 $ Cladding
  164     2    -1.6 14 -4 -202           u=3 $ GRAPHITE
  165     9    -7.9 4 -3                 u=3 $ TOP SS cap
  166     9    -7.9 3 -201               u=3 $ Upper pin
  167     6      -1 3 201                u=3 $ Water around pin
c ** CENTRAL THIMBLE: UNIVERSE = [4]
  170     6      -1 12 -202              u=4 $ Water over midplane
  171     7  -2.699 -12 :202             u=4 $ Below centerline
c ** SOURCE: UNIVERSE = [5]
  175     7  -2.699 -233 :230 :232       u=5 $ SOURCE HOLDER
  176     9 -0.394473 233 -234 -231      u=5 $ SOURCE, SS SHELL
  177     3 -0.001239 -232 233 -230 #176 u=5 $ SOURCE CAVITY
c ** THIMBLE: UNIVERSE = [6]
  180     6      -1 -21 201              u=6 $ Water around lower pin
  181     7  -2.699 -21 -201             u=6 $ Bottom pin
  182     7  -2.699 21 -14               u=6 $ BOTTOM cap
  183     7  -2.699 14 210               u=6 $ Thimble TUBE
  184     6      -1 14 -210              u=6 $ Thimble Water
c ** CORE & FUEL: UNIVERSE = [7]
c ** WATER AROUND UPPER PINS & GRID PLATE ***********************************
  185     6      -1 -1 5 1201 1202 1203 1204 1205 1206 1301 1302 1303 $ H20
             1304 1305 1306 1307 1308 1309 1310 1311 1312 1401 1402 1403 1404
             1405 1406 1407 1408 1409 1410 1411 1412 1413 1414 1415 1416 1417
             1418 1501 1502 1503 1504 1505 1506 1507 1508 1509 1510 1511 1512
             1513 1514 1515 1516 1517 1518 1519 1520 1521 1522 1523 1524 1601
             1602 1603 1604 1605 1606 1607 1608 1609 1610 1611 1612 1613 1614
             1615 1616 1617 1618 1619 1620 1621 1622 1623 1624 1625 1626 1627
             1628 1629 1630 203                                      u=7
c ** UPPER GRID PLATE *******************************************************
  186     7  -2.699 -5 8 1201 1202 1203 1204 1205 1206 1301 $ U17ER GRID PLAT
             1302 1303 1304 1305 1306 1307 1308 1309 1310 1311 1312 1401 1402
             1403 1404 1405 1406 1407 1408 1409 1410 1411 1412 1413 1414 1415
             1416 1417 1418 1501 1502 1503 1504 1505 1506 1507 1508 1509 1510
             1511 1512 1513 1514 1515 1516 1517 1518 1519 1520 1521 1522 1523
             1524 1601 1602 1603 1604 1605 1606 1607 1608 1609 1610 1611 1612
             1613 1614 1615 1616 1617 1618 1619 1620 1621 1622 1623 1624 1625
             1626 1627 1628 1629 1630 203                            u=7
c ** CORE WATER *************************************************************
  187     6      -1 -8 1201 1202 1203 1204 1205 1206 1301 1302 1303 $ CORE H2O
             1304 1305 1306 1307 1308 1309 1310 1311 1312 1401 1402 1403 1404
             1405 1406 1407 1408 1409 1410 1411 1412 1413 1414 1415 1416 1417
             1418 1501 1502 1503 1504 1505 1506 1507 1508 1509 1510 1511 1512
             1513 1514 1515 1516 1517 1518 1519 1520 1521 1522 1523 1524 1601
             1602 1603 1604 1605 1606 1607 1608 1609 1610 1611 1612 1613 1614
             1615 1616 1617 1618 1619 1620 1621 1622 1623 1624 1625 1626 1627
             1628 1629 1630 203                                      u=7
c ** FUEL POSITIONS *********************************************************
c ** central thimble
 1100     0         -203  fill=4                                     u=7 $ CT
c ** B Ring
  201     0         -1201  fill=201 (0 4.05384 0 )                     u=7 $ B-1
  202     0         -1202  fill=202 (3.510728 2.02692 0 )              u=7 $ B-2
  203     0         -1203  fill=203 (3.510728 -2.02692 0 )             u=7 $ B-3
  204     0         -1204  fill=204 (0 -4.05384 0 )                    u=7 $ B-4
  205     0         -1205  fill=205 (-3.510728 -2.02692 0 )            u=7 $ B-5
  206     0         -1206  fill=206 (-3.510728 2.02692 0 )             u=7 $ B-6
c ** C Ring
  301     0         -1301  fill=301 (0 7.98068 0 )                     u=7 $ C-1
  302     0         -1302  fill=302 (3.99034 6.911472 0 )              u=7 $ C-2
  303     0         -1303  fill=303 (6.911472 3.99034 0 )              u=7 $ C-3
  304     0         -1304  fill=304 (7.98068 0 0 )                     u=7 $ C-4
  305     0         -1305  fill=305 (6.911472 -3.99034 0 )             u=7 $ C-5
  306     0         -1306  fill=306 (3.99034 -6.911472 0 )             u=7 $ C-6
c ******************** PULSE ROD **********************************************
  307     0         -1307  fill=21 (0 -7.98068 39.37 )               u=7 $ C-7
c *** 0.03937 cm/unit *** OUT 60% 23.622 *** OUT 100% 39.37 *** CRIT 15.622
c *****************************************************************************
c ** THIMBLE=6 WATER=8 FUEL=1
  308     0         -1308  fill=308 (-3.99034 -6.911472 0 )            u=7 $ C-8
  309     0         -1309  fill=309 (-6.911472 -3.99034 0 )            u=7 $ C-9
  310     0         -1310  fill=310 (-7.98068 0 0 )                    u=7 $ C-10
  311     0         -1311  fill=311 (-6.911472 3.99034 0 )             u=7 $ C-11
  312     0         -1312  fill=312 (-3.99034 6.911472 0 )             u=7 $ C-12
c ** D Ring
  401     0         -1401  fill=401 (0 11.94562 0 )                    u=7 $ D-1
  402     0         -1402  fill=402 (4.085643 11.22521 0 )             u=7 $ D-2
  403     0         -1403  fill=403 (7.678497 9.150876 0 )             u=7 $ D-3
c ****************************SAFETY ROD***************************************
  404     0         -1404  fill=22 (10.34521 5.97281 33.02 )         u=7 $ D-4
C *** 0.03302 cm/unit *** OUT 60% 19.812 *** OUT 100% 33.02 *** CRIT 11.02
c *****************************************************************************
  405     0         -1405  fill=405 (11.76414 2.074335 0 )             u=7 $ D-5
  406     0         -1406  fill=406 (11.76414 -2.074335 0 )            u=7 $ D-6
  407     0         -1407  fill=407 (10.34521 -5.97281 0 )             u=7 $ D-7
  408     0         -1408  fill=408 (7.678497 -9.150876 0 )            u=7 $ D-8
  409     0         -1409  fill=409 (4.085643 -11.22521 0 )            u=7 $ D-9
  410     0         -1410  fill=410 (0 -11.94562 0 )                   u=7 $ D-10
  411     0         -1411  fill=411 (-4.085643 -11.22521 0 )           u=7 $ D 11
  412     0         -1412  fill=412 (-7.678497 -9.150876 0 )           u=7 $ D 12
  413     0         -1413  fill=413 (-10.34521 -5.97281 0 )            u=7 $ D 13
  414     0         -1414  fill=414 (-11.76414 -2.074335 0 )           u=7 $ D-14
  415     0         -1415  fill=415 (-11.76414 2.074335 0 )            u=7 $ D 15
c ****************************SHIM ROD******************************************
  416     0         -1416  fill=23 (-10.34521 5.97281  43.18 )       u=7 $ D-16
C  *** 0.04318 cm/unit *** 60% OUT 25.908 *** 100% OUT 43.18 *** CRIT 15.908
c ******************************************************************************
  417     0         -1417  fill=417 (-7.678497 9.150876 0 )            u=7 $ D-17
  418     0         -1418  fill=418 (-4.085643 11.22511 0 )            u=7 $ D-18
c ** E Ring
c ****************************REGULATING ROD************************************
  501     0         -1501  fill=24 (0 15.91564 41.91 ) u=7 $ E-1
C  *** 0.04191 cm/unit *** 60% OUT 25.146 *** 100% OUT 41.91 *** CRIT 0
c ******************************************************************************
  502     0         -1502  fill=502 (4.119271 15.37333 0 )             u=7 $ E-2
  503     0         -1503  fill=503 (7.95782 13.78335 0 )              u=7 $ E-3
  504     0         -1504  fill=504 (11.25406 11.25406 0 )             u=7 $ E-4
  505     0         -1505  fill=505 (13.78335 7.95782 0 )              u=7 $ E-5
  506     0         -1506  fill=506 (15.37333 4.119271 0 )             u=7 $ E-6
  507     0         -1507  fill=507 (15.91564 0 0 )                    u=7 $ E-7
  508     0         -1508  fill=508 (15.37333 -4.119271 0 )            u=7 $ E-8
  509     0         -1509  fill=509 (13.78335 -7.95782 0 )             u=7 $ E-9
  510     0         -1510  fill=510 (11.25406 -11.25406 0 )            u=7 $ E-10
  511     0         -1511  fill=511 (7.95782 -13.78335 0 )             u=7 $ E-11
  512     0         -1512  fill=512 (4.119271 -15.37333 0 )            u=7 $ E-12
  513     0         -1513  fill=513 (0 -15.91564 0 )                   u=7 $ E-13
  514     0         -1514  fill=514 (-4.119271 -15.37333 0 )           u=7 $ E-14
  515     0         -1515  fill=515 (-7.95782 -13.78335 0 )            u=7 $ E-15
  516     0         -1516  fill=516 (-11.25406 -11.25406 0 )           u=7 $ E-16
  517     0         -1517  fill=517 (-13.78335 -7.95782 0 )            u=7 $ E-17
  518     0         -1518  fill=518 (-15.37333 -4.119271 0 )           u=7 $ E-18
  519     0         -1519  fill=519 (-15.91564 0 0 )                   u=7 $ E-19
  520     0         -1520  fill=520 (-15.37333 4.119271 0 )            u=7 $ E-20
  521     0         -1521  fill=521 (-13.78335 7.95782 0 )             u=7 $ E-21
  522     0         -1522  fill=522 (-11.25406 11.25406 0 )            u=7 $ E-22
  523     0         -1523  fill=523 (-7.95782 13.78335 )               u=7 $ E-23
  524     0         -1524  fill=524 (-4.119271 15.37333 0 )            u=7 $ E-24
c ** F Ring
  601     0         -1601  fill=601 (0 19.8882 0 )                     u=7 $ F-1
  602     0         -1602  fill=602 (4.134989 19.45359 0 )             u=7 $ F-2
  603     0         -1603  fill=603 (8.08926 18.16878 0 )              u=7 $ F-3
  604     0         -1604  fill=604 (11.68999 16.08989 0 )             u=7 $ F-4
  605     0         -1605  fill=605 (14.77981 13.30878 0 )             u=7 $ F-5
  606     0         -1606  fill=606 (17.22369 9.9441 0 )               u=7 $ F-6
  607     0         -1607  fill=607 (18.9148 6.145792 0 )              u=7 $ F-7
  608     0         -1608  fill=608 (19.77925 2.078883 0 )             u=7 $ F-8
  609     0         -1609  fill=609 (19.77925 -2.078883 0 )            u=7 $ F-9
c ** SOURCE IS UNIVERSE 5, WATER VOID IS UNIVERSE 8
  610     0         -1610  fill=5 (18.9148 -6.145792 0 )             u=7 $ F-10 SRC = 5
  611     0         -1611  fill=611 (17.22369 -9.9441 0 )              u=7 $ F-11
  612     0         -1612  fill=612 (14.77981 -13.3078 0 )             u=7 $ F-12
c ** TEST FOR FUEL WORTH (fill=1) COMPARED TO WATER VOID (fill=8)
  613     0         -1613  fill=613 (11.68999 -16.08989 0 )            u=7 $ F-13 ****
  614     0         -1614  fill=614 (8.08926 -18.16878 0 )             u=7 $ F-14
  615     0         -1615  fill=615 (4.134989 -19.45359 0 )            u=7 $ F-15
  616     0         -1616  fill=616 (0 -19.8882 0 )                    u=7 $ F-16
  617     0         -1617  fill=617 (-4.134989 -19.45359 0 )           u=7 $ F-17
  618     0         -1618  fill=618 (-8.08926 -18.16878 0 )            u=7 $ F-18
c ** TEST FOR FUEL WORTH (fill=1) COMPARED TO WATER VOID (fill=8)
  619     0         -1619  fill=619 (-11.68999 -16.08989 0 )           u=7 $ F-19 ****
  620     0         -1620  fill=620 (-14.77981 -13.3078 0 )            u=7 $ F-20
  621     0         -1621  fill=621 (-17.22369 -9.9441 0 )             u=7 $ F-21
  622     0         -1622  fill=622 (-18.9148 -6.145792 0 )            u=7 $ F-22
  623     0         -1623  fill=623 (-19.77925 -2.078883 0 )           u=7 $ F-23
C ** RABBIT IS UNIVERSE 2, WATER VOID IS UNIVERSE 8, RABBIT REMOVED FOR CORE III-4
  624     0         -1624  fill=624 (-19.77925 2.078883 0 )            u=7 $ F-24 Old rabbit location
  625     0         -1625  fill=625 (-18.9148 6.145792 0 )             u=7 $ F-25
  626     0         -1626  fill=626 (-17.22369 9.9441 0 )              u=7 $ F-26
  627     0         -1627  fill=627 (-14.77981 13.3078 0 )             u=7 $ F-27
  628     0         -1628  fill=628 (-11.68999 16.08989 0 )            u=7 $ F-28
  629     0         -1629  fill=629 (-8.08926 18.16878 0 )             u=7 $ F-29
  630     0         -1630  fill=630 (-4.134989 19.45359 0 )            u=7 $ F-30

c SURFACES
c ***  ELEVATIONS **************************************************************
    1        pz 50  $ POOL SURFACE
    2        pz 37.2618  $ TOP OF FUEL PINS
    3        pz 33.782  $ Top of end cap
    4        pz 30.3276  $ Top of gap/CLADDING
    5        pz 33.79  $ Top of grid plate
    6        pz 27.7876  $ Top of axial reflector
    7        pz 27.94  $ REFLECTOR CANNISTER
    8        pz 31.162  $ **** Bottom top grid
    9        pz 26.035  $ RADIAL REFLECTOR TOP
   10        pz 19.05  $ Top of fuel
   11        pz 0.635  $ RSR FLOOR
   12        pz 0  $ RSR SUBFLOOR -- LINE OF FUEL SYMMETRTY
   13        pz -19.05  $ Bottom of fuel (38.1/2 cm)
c **  BEST ESTIMATE 3.74 in = 9.4996 cm {-19.05 cm -9.4996 cm}=>
   14        pz -27.7876 $ Bottom of axial reflector/CLADDING
c **  APPROX CONE 3.797 cm base 3.797 cm heigth
   21        pz -32      $ Bottom of plug/top of pin
   15        pz -34.163  $ Top of bottom grid plate
   16        pz -26.035  $ RADIAL REFLECTOR BOTTOM
   17        pz -27.305  $ REFLECTOR CANNISTER BOTTOM
   18        pz -36.07  $ Bottom of grid plate
   20        pz -50  $ BOTTOM OF POOL
c *** OTHER PLANES *************************************************************
   25        pz -5.0 $ Bottom of thick part of rabbit
   26        px 0  $ CORE 1/2
  100        pz 14.2875  $ FUEL division
  101        pz 9.525  $ FUEL division
  102        pz 4.7625  $ FUEL division
  103        pz 0.0  $ FUEL division
  104        pz -4.7625  $ FUEL division
  105        pz -9.525  $ FUEL division
  106        pz -14.2875  $ FUEL division
c *** Z CYLINDERS **************************************************************
   30        cz 22.85   $ CORE/REFLECTOR WALL
   31        cz 23.485  $ INNER REFLECTOR
   32        cz 33.02   $ RSR INNER WALL
   33        cz 33.665  $ RSR INNER WALL
   34        cz 37.465  $ RSR OUTER VOLUME
   35        cz 38.1    $ RSR OUTER WALL
   36        cz 53.35   $ OUTER REFLECTOR
   37        cz 53.975  $ OUTER REFLECTOR WALL
   38        cz 60      $ EDGE OF POOL
c *** OTHER CYLINDERS **********************************************************
   40     1 c/x 0 -8.3 8.255  $ NE/SW BEAM PORT
   90     1 c/x 0 -8.3 7.62   $ NE/SW BEAM PORT
   43        cz 22            $ LOWER GRID PLATE RADIUS
   44        cz 24.75         $ UPPER GRID PLATE RADIUS
   45        cz 1.0           $ Bottom part of rabbit, above pin
c *** FLUX PROBE HOLES *********************************************************
   50        pz -12.4373   $ Pulse rod, span 39.37 cm
   51        pz -12.6811   $ Safety rod, span 33.02 cm
   52        pz -26.0390   $ Shim rod, span 43.18
   53        pz -21.3628   $ Regulating rod, span 41.91
   68        pz 24.257
c ** UNIVERSE FUEL PIN cylinders ***********************************************
  200        cz 0.2285   $ Zirc FILLer
  201        cz 0.635    $ Pin diameter
  202        cz 1.8477   $ Fuel diameter MARK III FUEL SCHEMATIC
  203        cz 1.985    $ CT & RABBIT
c ** UNIVERSE CONTROL ROD cylinders ********************************************
  210        cz 1.69165  $ Guide tube outer radius 1.89865 cm
  219        cz 1.58815  $ REG guide tube surface
  211        cz 1.511    $ Pulse meat
  212        cz 1.587    $ Pulse rod cladding surface
  213        cz 1.5113   $ Shim/safety meat
  214        cz 1.5875   $ Shim/safety rod cladding surface
  215        cz 1.03505  $ Rod reg meat
  216        cz 1.11125  $ Reg rod cladding surface
  217        cz 1.254    $ Extension tube outer radius
  218        cz 0.619    $ Extesion tube inner radius
c ** UNIVERSE SOURCE ***********************************************************
  230        cz 0.981  $ SOURCE HOLDER CAVITY
  231        cz 0.9525  $ SOURCE RADIUS
c source elevations ALSO USES SOME FUEL ELEVATIONS
  232        pz 3.8  $ Source cavity top
  233        pz -3.8  $ Source cavity bottom
  234        pz 2.55  $ Source heigth
c ******* END OF UNIVERSE SURFACE DEFINTIONS ***********************************
c ** A RING USES SURFACE 203 ***************************************************
c 1000      c/z 0 0 1.8985         $ A-1 = surface 203
c ** B Ring ********************************************************************
 1201       c/z 0 4.05384 1.8985$ B-1
 1202       c/z 3.510728 2.02692 1.8985      $ B-2
 1203       c/z 3.510728 -2.02692 1.8985     $ B-3
 1204       c/z 0 -4.05384 1.8985            $ B-4
 1205       c/z -3.510728 -2.02692 1.8985    $ B-5
 1206       c/z -3.510728 2.02692 1.8985     $ B-6
c ** C Ring ********************************************************************
 1301       c/z 0 7.98068 1.8985$ c-1
 1302       c/z 3.99034 6.911472 1.8985      $ C-2
 1303       c/z 6.911472 3.99034 1.8985      $ C-3
 1304       c/z 7.98068 0 1.8985             $ C-4
 1305       c/z 6.911472 -3.99034 1.8985     $ C-5
 1306       c/z 3.99034 -6.911472 1.8985     $ C-6
 1307       c/z 0 -7.98068 1.8985            $ C-7
 1308       c/z -3.99034 -6.911472 1.8985    $ C-8
 1309       c/z -6.911472 -3.99034 1.8985    $ C-9
 1310       c/z -7.98068 0 1.8985            $ C-10
 1311       c/z -6.911472 3.99034 1.8985     $ C-11
 1312       c/z -3.99034 6.911472 1.8985     $ C-12
c ** D Ring ********************************************************************
 1401       c/z 0 11.94562 1.8985            $ D-1
 1402       c/z 4.085643 11.225211 1.8985    $ D-2
 1403       c/z 7.678497 9.150876 1.8985     $ D-3
 1404       c/z 10.34521 5.97281 1.8985      $ D-4
 1405       c/z 11.764139 2.074335 1.8985    $ D-5
 1406       c/z 11.764139 -2.074335 1.8985   $ D-6
 1407       c/z 10.34521 -5.97281 1.8985     $ D-7
 1408       c/z 7.678497 -9.150876 1.8985    $ D-8
 1409       c/z 4.119271 -11.225211 1.8985   $ D-9
 1410       c/z 0 -11.94562 1.8985           $ D-10
 1411       c/z -4.119271 -11.225211 1.8985  $ D 11
 1412       c/z -7.678497 -9.150876 1.8985   $ D 12
 1413       c/z -10.34521 -5.97281 1.8985    $ D 13
 1414       c/z -11.764139 -2.074335 1.8985  $ D-14
 1415       c/z -11.764139 2.074335 1.8985   $ D 15
 1416       c/z -10.34521 5.97281 1.8985     $ D-16
 1417       c/z -7.678497 9.150876 1.8985    $ D-17
 1418       c/z -4.119271 11.225211 1.8985   $ D-18
c ** E RING ********************************************************************
 1501       c/z 0 15.91564 1.8985            $ E-1
 1502       c/z 4.119271 15.373328 1.8985    $ E-2
 1503       c/z 7.95782 13.783349 1.8985     $ E-3
 1504       c/z 11.254057 11.254057 1.8985   $ E-4
 1505       c/z 13.783349 7.95782 1.8985     $ E-5
 1506       c/z 15.373328 4.119271 1.8985    $ E-6
 1507       c/z 15.91564 0 1.8985            $ E-7
 1508       c/z 15.373328 -4.119271 1.8985   $ E-8
 1509       c/z 13.783349 -7.95782 1.8985    $ E-9
 1510       c/z 11.254057 -11.254057 1.8985  $ E-10
 1511       c/z 7.95782 -13.783349 1.8985    $ E-11
 1512       c/z 4.119271 -15.373328 1.8985   $ E-12
 1513       c/z 0 -15.91564 1.8985           $ E-13
 1514       c/z -4.119271 -15.373328 1.8985  $ E-14
 1515       c/z -7.95782 -13.783349 1.8985   $ E-15
 1516       c/z -11.254057 -11.254057 1.8985 $ E-16
 1517       c/z -13.783349 -7.95782 1.8985   $ E-17
 1518       c/z -15.373328 -4.119271 1.8985  $ E-18
 1519       c/z -15.91564 0 1.8985           $ E-19
 1520       c/z -15.373328 4.119271 1.8985   $ E-20
 1521       c/z -13.783349 7.95782 1.8985    $ E-21
 1522       c/z -11.254057 11.254057 1.8985  $ E-22
 1523       c/z -7.95782 13.783349 1.8985    $ E-23
 1524       c/z -4.119271 15.373328 1.8985   $ E-24
c ** F Ring ********************************************************************
 1601       c/z 0 19.8882 1.8985             $ F-1
 1602       c/z 4.134989 19.453595 1.8985    $ F-2
 1603       c/z 8.08926 18.168775 1.8985     $ F-3
 1604       c/z 11.689991 16.089892 1.8985   $ F-4
 1605       c/z 14.779813 13.3087803 1.8985  $ F-5
 1606       c/z 17.223686 9.9441 1.8985      $ F-6
 1607       c/z 18.914802 6.145792 1.8985    $ F-7
 1608       c/z 19.77925 2.078883 1.8985     $ F-8
 1609       c/z 19.77925 -2.078883 1.8985    $ F-9
 1610       c/z 18.914802 -6.145792 1.8985   $ F-10 SOURCE
 1611       c/z 17.223686 -9.9441 1.8985     $ F-11
 1612       c/z 14.779813 -13.307803 1.8985  $ F-12
 1613       c/z 11.689991 -16.089892 1.8985  $ F-13
 1614       c/z 8.08926 -18.168775 1.8985    $ F-14
 1615       c/z 4.134989 -19.453595 1.8985   $ F-15
 1616       c/z 0 -19.8882 1.8985            $ F-16
 1617       c/z -4.134989 -19.453595 1.8985  $ F-17
 1618       c/z -8.08926 -18.168775 1.8985   $ F-18
 1619       c/z -11.689991 -16.089892 1.8985 $ F-19
 1620       c/z -14.779813 -13.307803 1.8985 $ F-20
 1621       c/z -17.223686 -9.9441 1.8985    $ F-21
 1622       c/z -18.914802 -6.145792 1.8985  $ F-22
 1623       c/z -19.77925 -2.078883 1.8985   $ F-23 RABBIT
 1624       c/z -19.77925 2.078883 1.8985    $ F-24
 1625       c/z -18.914802 6.145792 1.8985   $ F-25
 1626       c/z -17.223686 9.9441 1.8985     $ F-26
 1627       c/z -14.779813 13.307803 1.8985  $ F-27
 1628       c/z -11.689991 16.089892 1.8985  $ F-28
 1629       c/z -8.08926 18.168775 1.8985    $ F-29
 1630       c/z -4.134989 19.453595 1.8985   $ F-30

tr1  0 0 0 0.6428 0.776 0 -0.776 0.6428 0 0 0 1
mode  n
kcode 100000 1.000000 10 110
c    MATERIAL CARDS
c    U + Zr-H  rho=5.7473 g/cm^3 BOL
c    S(a,b)- Zr-H @ 300 K
c ******************************************************************************
c This current model only accounts for the burnup of U235
c **  B-1  ** U235 left after Burnup = 37.012 g ** Density = 5.685
m201       92235.71c -0.016144
           92238.71c -0.066645
           40090.71c -0.900788
           1001.71c  -0.016422
c **  B-2  ** U235 left after Burnup = 36.731 g ** Density = 5.681
m202       92235.71c -0.016022
           92238.71c -0.066140
           40090.71c -0.901405
           1001.71c  -0.016433
c **  B-3  ** U235 left after Burnup = 37.012 g ** Density = 5.685
m203       92235.71c -0.016144
           92238.71c -0.066645
           40090.71c -0.900788
           1001.71c  -0.016422
c **  B-4  ** U235 left after Burnup = 37.315 g ** Density = 5.688
m204       92235.71c -0.016276
           92238.71c -0.067191
           40090.71c -0.900123
           1001.71c  -0.016410
c **  B-5  ** U235 left after Burnup = 36.985 g ** Density = 5.684
m205       92235.71c -0.016132
           92238.71c -0.066598
           40090.71c -0.900847
           1001.71c  -0.016423
c **  B-6  ** U235 left after Burnup = 37.034 g ** Density = 5.684
m206       92235.71c -0.016154
           92238.71c -0.066686
           40090.71c -0.900739
           1001.71c  -0.016421
c **  C-1  ** U235 left after Burnup = 36.691 g ** Density = 5.680
m301       92235.71c -0.016004
           92238.71c -0.066068
           40090.71c -0.901493
           1001.71c  -0.016435
c **  C-2  ** U235 left after Burnup = 37.012 g ** Density = 5.684
m302       92235.71c -0.016144
           92238.71c -0.066646
           40090.71c -0.900788
           1001.71c  -0.016422
c **  C-3  ** U235 left after Burnup = 37.515 g ** Density = 5.691
m303       92235.71c -0.016363
           92238.71c -0.067552
           40090.71c -0.899683
           1001.71c  -0.016402
c **  C-4  ** U235 left after Burnup = 33.388 g ** Density = 5.638
m304       92235.71c -0.014563
           92238.71c -0.060120
           40090.71c -0.908749
           1001.71c  -0.016567
c **  C-5  ** U235 left after Burnup = 39.023 g ** Density = 5.710
m305       92235.71c -0.017021
           92238.71c -0.070267
           40090.71c -0.896370
           1001.71c  -0.016342
c **  C-6  ** U235 left after Burnup = 34.287 g ** Density = 5.649
m306       92235.71c -0.014955
           92238.71c -0.061739
           40090.71c -0.906774
           1001.71c  -0.016531
c **  C-8  ** U235 left after Burnup = 37.690 g ** Density = 5.693
m308       92235.71c -0.016440
           92238.71c -0.067867
           40090.71c -0.899298
           1001.71c  -0.016395
c **  C-9  ** U235 left after Burnup = 37.012 g ** Density = 5.684
m309       92235.71c -0.016144
           92238.71c -0.066646
           40090.71c -0.900788
           1001.71c  -0.016422
c **  C-10  ** U235 left after Burnup = 37.012 g ** Density = 5.684
m310       92235.71c -0.016144
           92238.71c -0.066646
           40090.71c -0.900788
           1001.71c  -0.016422
c **  C-11  ** U235 left after Burnup = 37.012 g ** Density = 5.684
m311       92235.71c -0.016144
           92238.71c -0.066646
           40090.71c -0.900788
           1001.71c  -0.016422
c **  C-12  ** U235 left after Burnup = 37.012 g ** Density = 5.684
m312       92235.71c -0.016144
           92238.71c -0.066646
           40090.71c -0.900788
           1001.71c  -0.016422
c **  D-1  ** U235 left after Burnup = 33.326 g ** Density = 5.637
m401       92235.71c -0.014536
           92238.71c -0.060009
           40090.71c -0.908885
           1001.71c  -0.016570
c **  D-2  ** U235 left after Burnup = 34.700 g ** Density = 5.655
m402       92235.71c -0.015136
           92238.71c -0.062483
           40090.71c -0.905867
           1001.71c  -0.016515
c **  D-3  ** U235 left after Burnup = 32.480 g ** Density = 5.626
m403       92235.71c -0.014167
           92238.71c -0.058485
           40090.71c -0.910744
           1001.71c  -0.016604
c **  D-5  ** U235 left after Burnup = 33.266 g ** Density = 5.636
m405       92235.71c -0.014510
           92238.71c -0.059901
           40090.71c -0.909017
           1001.71c  -0.016572
c **  D-6  ** U235 left after Burnup = 38.012 g ** Density = 5.697
m406       92235.71c -0.016580
           92238.71c -0.068447
           40090.71c -0.898591
           1001.71c  -0.016382
c **  D-7  ** U235 left after Burnup = 34.046 g ** Density = 5.646
m407       92235.71c -0.014850
           92238.71c -0.061305
           40090.71c -0.907303
           1001.71c  -0.016541
c **  D-8  ** U235 left after Burnup = 33.278 g ** Density = 5.636
m408       92235.71c -0.014515
           92238.71c -0.059922
           40090.71c -0.908991
           1001.71c  -0.016572
c **  D-9  ** U235 left after Burnup = 33.703 g ** Density = 5.642
m409       92235.71c -0.014701
           92238.71c -0.060688
           40090.71c -0.908057
           1001.71c  -0.016555
c **  D-10  ** U235 left after Burnup = 32.929 g ** Density = 5.632
m410       92235.71c -0.014363
           92238.71c -0.059294
           40090.71c -0.909757
           1001.71c  -0.016586
c **  D-11  ** U235 left after Burnup = 33.658 g ** Density = 5.641
m411       92235.71c -0.014363
           92238.71c -0.059294
           40090.71c -0.909757
           1001.71c  -0.016586
c **  D-12  ** U235 left after Burnup = 34.711 g ** Density = 5.655
m412       92235.71c -0.015140
           92238.71c -0.062503
           40090.71c -0.905843
           1001.71c  -0.016514
c **  D-13  ** U235 left after Burnup = 33.835 g ** Density = 5.644
m413       92235.71c -0.014758
           92238.71c -0.060925
           40090.71c -0.907767
           1001.71c  -0.016549
c **  D-14  ** U235 left after Burnup = 35.835 g ** Density = 5.669
m414       92235.71c -0.015631
           92238.71c -0.064527
           40090.71c -0.903373
           1001.71c  -0.016469
c **  D-15  ** U235 left after Burnup = 34.841 g ** Density = 5.656
m415       92235.71c -0.015197
           92238.71c -0.062737
           40090.71c -0.905557
           1001.71c  -0.016509
c **  D-17  ** U235 left after Burnup = 34.835 g ** Density = 5.656
m417       92235.71c -0.015194
           92238.71c -0.062726
           40090.71c -0.905570
           1001.71c  -0.016509
c **  D-18  ** U235 left after Burnup = 33.822 g ** Density = 5.643
m418       92235.71c -0.014753
           92238.71c -0.060902
           40090.71c -0.907796
           1001.71c  -0.016550
c **  E-2  ** U235 left after Burnup = 37.211 g ** Density = 5.687
m502       92235.71c -0.016231
           92238.71c -0.067004
           40090.71c -0.900351
           1001.71c  -0.016414
c **  E-3  ** U235 left after Burnup = 32.929 g ** Density = 5.632
m503       92235.71c -0.014363
           92238.71c -0.059294
           40090.71c -0.909757
           1001.71c  -0.016586
c **  E-4  ** U235 left after Burnup = 33.692 g ** Density = 5.642
m504       92235.71c -0.014696
           92238.71c -0.060668
           40090.71c -0.908081
           1001.71c  -0.016555
c **  E-5  ** U235 left after Burnup = 32.388 g ** Density = 5.625
m505       92235.71c -0.014127
           92238.71c -0.058320
           40090.71c -0.910946
           1001.71c  -0.016607
c **  E-6  ** U235 left after Burnup = 32.503 g ** Density = 5.627
m506       92235.71c -0.014177
           92238.71c -0.058527
           40090.71c -0.910693
           1001.71c  -0.016603
c **  E-7  ** U235 left after Burnup = 31.991 g ** Density = 5.620
m507       92235.71c -0.013954
           92238.71c -0.057605
           40090.71c -0.911818
           1001.71c  -0.016623
c **  E-8  ** U235 left after Burnup = 32.288 g ** Density = 5.624
m508       92235.71c -0.014084
           92238.71c -0.058140
           40090.71c -0.911165
           1001.71c  -0.016611
c **  E-9  ** U235 left after Burnup = 29.517 g ** Density = 5.588
m509       92235.71c -0.012875
           92238.71c -0.053150
           40090.71c -0.917253
           1001.71c  -0.016722
c **  E-10  ** U235 left after Burnup = 31.776 g ** Density = 5.617
m510       92235.71c -0.013860
           92238.71c -0.057218
           40090.71c -0.912290
           1001.71c  -0.016632
c **  E-11  ** U235 left after Burnup = 32.835 g ** Density = 5.631
m511       92235.71c -0.014322
           92238.71c -0.059125
           40090.71c -0.909964
           1001.71c  -0.016590
c **  E-12  ** U235 left after Burnup = 34.835 g ** Density = 5.656
m512       92235.71c -0.015194
           92238.71c -0.062726
           40090.71c -0.905570
           1001.71c  -0.016509
c **  E-13  ** U235 left after Burnup = 37.713 g ** Density = 5.693
m513       92235.71c -0.016450
           92238.71c -0.067908
           40090.71c -0.899248
           1001.71c  -0.016394
c **  E-14  ** U235 left after Burnup = 33.254 g ** Density = 5.636
m514       92235.71c -0.014505
           92238.71c -0.059879
           40090.71c -0.909043
           1001.71c  -0.016573
c **  E-15  ** U235 left after Burnup = 37.636 g ** Density = 5.692
m515       92235.71c -0.016416
           92238.71c -0.067770
           40090.71c -0.899417
           1001.71c  -0.016397
c **  E-16  ** U235 left after Burnup = 31.948 g ** Density = 5.619
m516       92235.71c -0.013935
           92238.71c -0.057527
           40090.71c -0.911912
           1001.71c  -0.016625
c **  E-17  ** U235 left after Burnup = 35.937 g ** Density = 5.670
m517       92235.71c -0.015675
           92238.71c -0.064710
           40090.71c -0.903149
           1001.71c  -0.016465
c **  E-18  ** U235 left after Burnup = 34.960 g ** Density = 5.658
m518       92235.71c -0.015249
           92238.71c -0.062951
           40090.71c -0.905296
           1001.71c  -0.016504
c **  E-19  ** U235 left after Burnup = 34.855 g ** Density = 5.657
m519       92235.71c -0.015203
           92238.71c -0.062762
           40090.71c -0.905526
           1001.71c  -0.016509
c **  E-20  ** U235 left after Burnup = 34.234 g ** Density = 5.649
m520       92235.71c -0.014932
           92238.71c -0.061644
           40090.71c -0.906890
           1001.71c  -0.016533
c **  E-21  ** U235 left after Burnup = 33.977 g ** Density = 5.645
m521       92235.71c -0.014820
           92238.71c -0.061181
           40090.71c -0.907455
           1001.71c  -0.016544
c **  E-22  ** U235 left after Burnup = 34.021 g ** Density = 5.646
m522       92235.71c -0.014839
           92238.71c -0.061260
           40090.71c -0.907358
           1001.71c  -0.016542
c **  E-23  ** U235 left after Burnup = 33.599 g ** Density = 5.641
m523       92235.71c -0.014655
           92238.71c -0.060500
           40090.71c -0.908285
           1001.71c  -0.016559
c **  E-24  ** U235 left after Burnup = 33.226 g ** Density = 5.636
m524       92235.71c -0.014493
           92238.71c -0.059829
           40090.71c -0.909105
           1001.71c  -0.016574
c **  F-1  ** U235 left after Burnup = 31.327 g ** Density = 5.612
m601       92235.71c -0.013664
           92238.71c -0.056409
           40090.71c -0.913277
           1001.71c  -0.016650
c **  F-2  ** U235 left after Burnup = 31.467 g ** Density = 5.613
m602       92235.71c -0.013725
           92238.71c -0.056661
           40090.71c -0.912969
           1001.71c  -0.016644
c **  F-3  ** U235 left after Burnup = 32.486 g ** Density = 5.626
m603       92235.71c -0.014170
           92238.71c -0.058496
           40090.71c -0.910730
           1001.71c  -0.016603
c **  F-4  ** U235 left after Burnup = 31.438 g ** Density = 5.613
m604       92235.71c -0.013713
           92238.71c -0.056609
           40090.71c -0.913033
           1001.71c  -0.016645
c **  F-5  ** U235 left after Burnup = 31.456 g ** Density = 5.613
m605       92235.71c -0.013721
           92238.71c -0.056641
           40090.71c -0.912993
           1001.71c  -0.016645
c **  F-6  ** U235 left after Burnup = 38.012 g ** Density = 5.697
m606       92235.71c -0.016580
           92238.71c -0.068447
           40090.71c -0.898591
           1001.71c  -0.016382
c **  F-7  ** U235 left after Burnup = 30.816 g ** Density = 5.605
m607       92235.71c -0.013441
           92238.71c -0.055489
           40090.71c -0.914399
           1001.71c  -0.016670
c **  F-8  ** U235 left after Burnup = 31.404 g ** Density = 5.613
m608       92235.71c -0.013698
           92238.71c -0.056548
           40090.71c -0.913107
           1001.71c  -0.016647
c **  F-9  ** U235 left after Burnup = 31.418 g ** Density = 5.613
m609       92235.71c -0.013704
           92238.71c -0.056573
           40090.71c -0.913077
           1001.71c  -0.016646
c **  F-11  ** U235 left after Burnup = 30.355 g ** Density = 5.599
m611       92235.71c -0.013240
           92238.71c -0.054659
           40090.71c -0.915412
           1001.71c  -0.016689
c **  F-12  ** U235 left after Burnup = 38.461 g ** Density = 5.703
m612       92235.71c -0.016776
           92238.71c -0.069255
           40090.71c -0.897605
           1001.71c  -0.016364
c **  F-13  ** U235 left after Burnup = 32.407 g ** Density = 5.625
m613       92235.71c -0.014135
           92238.71c -0.058354
           40090.71c -0.910904
           1001.71c  -0.016607
c **  F-14  ** U235 left after Burnup = 30.445 g ** Density = 5.600
m614       92235.71c -0.013280
           92238.71c -0.054821
           40090.71c -0.915214
           1001.71c  -0.016685
c **  F-15  ** U235 left after Burnup = 30.903 g ** Density = 5.606
m615       92235.71c -0.013479
           92238.71c -0.055646
           40090.71c -0.914208
           1001.71c  -0.016667
c **  F-16  ** U235 left after Burnup = 30.326 g ** Density = 5.599
m616       92235.71c -0.013228
           92238.71c -0.054607
           40090.71c -0.915476
           1001.71c  -0.016690
c **  F-17  ** U235 left after Burnup = 30.081 g ** Density = 5.596
m617       92235.71c -0.013121
           92238.71c -0.054166
           40090.71c -0.916014
           1001.71c  -0.016700
c **  F-18  ** U235 left after Burnup = 30.344 g ** Density = 5.599
m618       92235.71c -0.013236
           92238.71c -0.054639
           40090.71c -0.915436
           1001.71c  -0.016689
c **  F-19  ** U235 left after Burnup = 33.099 g ** Density = 5.634
m619       92235.71c -0.014437
           92238.71c -0.059600
           40090.71c -0.909384
           1001.71c  -0.016579
c **  F-20  ** U235 left after Burnup = 37.540 g ** Density = 5.691
m620       92235.71c -0.016374
           92238.71c -0.067597
           40090.71c -0.899628
           1001.71c  -0.016401
c **  F-21  ** U235 left after Burnup = 31.381 g ** Density = 5.612
m621       92235.71c -0.013688
           92238.71c -0.056506
           40090.71c -0.913158
           1001.71c  -0.016648
c **  F-22  ** U235 left after Burnup = 35.890 g ** Density = 5.670
m622       92235.71c -0.015655
           92238.71c -0.064626
           40090.71c -0.903253
           1001.71c  -0.016467
c **  F-23  ** U235 left after Burnup = 30.368 g ** Density = 5.599
m623       92235.71c -0.015655
           92238.71c -0.064626
           40090.71c -0.903253
           1001.71c  -0.016467
c **  F-24  ** U235 left after Burnup = 30.079 g ** Density = 5.596
m624       92235.71c -0.013120
           92238.71c -0.054162
           40090.71c -0.916018
           1001.71c  -0.016700
c **  F-25  ** U235 left after Burnup = 30.667 g ** Density = 5.603
m625       92235.71c -0.013376
           92238.71c -0.055221
           40090.71c -0.914726
           1001.71c  -0.016676
c **  F-26  ** U235 left after Burnup = 38.339 g ** Density = 5.701
m626       92235.71c -0.016723
           92238.71c -0.069035
           40090.71c -0.897873
           1001.71c  -0.016369
c **  F-27  ** U235 left after Burnup = 31.103 g ** Density = 5.609
m627       92235.71c -0.013567
           92238.71c -0.056006
           40090.71c -0.913769
           1001.71c  -0.016659
c **  F-28  ** U235 left after Burnup = 33.415 g ** Density = 5.638
m628       92235.71c -0.014575
           92238.71c -0.060169
           40090.71c -0.908690
           1001.71c  -0.016566
c **  F-29  ** U235 left after Burnup = 36.881 g ** Density = 5.682
m629       92235.71c -0.016087
           92238.71c -0.066410
           40090.71c -0.901076
           1001.71c  -0.016427
c **  F-30  ** U235 left after Burnup = 36.760 g ** Density = 5.681
m630       92235.71c -0.016034
           92238.71c -0.066192
           40090.71c -0.901341
           1001.71c  -0.016432
c **  12 wt % New Fuel Elements  ** U235 = 52 g ** Density = 5.875
m700       92235.71c -0.022682
           92238.71c -0.093634
           40090.71c -0.867862
           1001.71c  -0.015822
c ******************************************************************************
c graphite rho = 1.6   g/cm^3
c S(a,b)- Carbon @ 300K
m2    6000.70c             -1  $MAT
c  Air rho = 0.001239 $ RSR AIR
m3 6000.70c -0.000124 7014.70c -0.755268 8016.70c -0.231781 18000 -0.012827
c Light water rho=1.00 g/cm^3
c S(a,b)- H20 @ 300K
m6    1001.70c        0.66667  $ Water
      8016.70c        0.33333
c Aluminum rho = 2.699 g/cm^3
m7    13027.70c            -1  $ Aluminum, 2.699 g/cc
c Zirconium $ Zirc  Filler, 6.5 g/cc
c S(a,b)- H20 @ 300K
m8    40090.71c  -1
c Stainless Steel rho =  7.9 g/cm^3
c m9  26000.55c   -1.0
m9    26000.55c    -0.67  $MAT
      24000.50c    -0.17
      28000.50c    -0.08849997
      42096.70c    -0.004452
c B4C SHIM & REG rod rho > 2.48 g/cm^3, email from GA,
c NEED TO ADJUST FOR BURNUP TO DIFFERENTIATE BETWEEN NEW ROD??
c rho 1.60-1.75 g/cm^3 from B. Ma
c 16% Boron from UIC TRIGA SAR
m11   6000.70c          -0.84  $ Pulse Rod, 1.6 g/cc,
      5010.70c          -0.0296
      5011.70c          -0.1304
c B4C rho > 2.48 g/cc, SHIM & REG, BUT THESE ARE OLD & PART BURNED
m12   6000.70c          -0.22  $ Shim Rod, 2.5 g/cc
      5010.70c          -0.1443
      5011.70c          -0.6357
c B4C rho >2.48 g/cc, SAFETY ROD
m13   6000.70c          -0.22  $ Shim Rod, 2.5 g/cc
      5010.70c          -0.1443
      5011.70c          -0.6357
c ******************************************************************************
imp:n             0            1 1760r          $ 1, 63012
c ******************************************************************************
c SOURCE DISTRIBUTED ACROSS THE CORE VOLUME
sdef ERG=D1 POS=0 0 -29 AXS=0 0 1 RAD=D2 EXT=D3
sp1 -3
si2 0 22.8
si3 0 45.7
c ******************************************************************************
mt201   h/zr.01t  zr/h.01t  $ uzrh-full  salphabeta card
mt202   h/zr.01t  zr/h.01t
mt203   h/zr.01t  zr/h.01t
mt204   h/zr.01t  zr/h.01t
mt205   h/zr.01t  zr/h.01t
mt206   h/zr.01t  zr/h.01t
mt301   h/zr.01t  zr/h.01t
mt302   h/zr.01t  zr/h.01t
mt303   h/zr.01t  zr/h.01t
mt304   h/zr.01t  zr/h.01t
mt305   h/zr.01t  zr/h.01t
mt306   h/zr.01t  zr/h.01t
mt308   h/zr.01t  zr/h.01t
mt309   h/zr.01t  zr/h.01t
mt310   h/zr.01t  zr/h.01t
mt311   h/zr.01t  zr/h.01t
mt312   h/zr.01t  zr/h.01t
mt401   h/zr.01t  zr/h.01t
mt402   h/zr.01t  zr/h.01t
mt403   h/zr.01t  zr/h.01t
mt405   h/zr.01t  zr/h.01t
mt406   h/zr.01t  zr/h.01t
mt407   h/zr.01t  zr/h.01t
mt408   h/zr.01t  zr/h.01t
mt409   h/zr.01t  zr/h.01t
mt410   h/zr.01t  zr/h.01t
mt411   h/zr.01t  zr/h.01t
mt412   h/zr.01t  zr/h.01t
mt413   h/zr.01t  zr/h.01t
mt414   h/zr.01t  zr/h.01t
mt415   h/zr.01t  zr/h.01t
mt417   h/zr.01t  zr/h.01t
mt418   h/zr.01t  zr/h.01t
mt502   h/zr.01t  zr/h.01t
mt503   h/zr.01t  zr/h.01t
mt504   h/zr.01t  zr/h.01t
mt505   h/zr.01t  zr/h.01t
mt506   h/zr.01t  zr/h.01t
mt507   h/zr.01t  zr/h.01t
mt508   h/zr.01t  zr/h.01t
mt509   h/zr.01t  zr/h.01t
mt510   h/zr.01t  zr/h.01t
mt511   h/zr.01t  zr/h.01t
mt512   h/zr.01t  zr/h.01t
mt513   h/zr.01t  zr/h.01t
mt514   h/zr.01t  zr/h.01t
mt515   h/zr.01t  zr/h.01t
mt516   h/zr.01t  zr/h.01t
mt517   h/zr.01t  zr/h.01t
mt518   h/zr.01t  zr/h.01t
mt519   h/zr.01t  zr/h.01t
mt520   h/zr.01t  zr/h.01t
mt521   h/zr.01t  zr/h.01t
mt522   h/zr.01t  zr/h.01t
mt523   h/zr.01t  zr/h.01t
mt524   h/zr.01t  zr/h.01t
mt601   h/zr.01t  zr/h.01t
mt602   h/zr.01t  zr/h.01t
mt603   h/zr.01t  zr/h.01t
mt604   h/zr.01t  zr/h.01t
mt605   h/zr.01t  zr/h.01t
mt606   h/zr.01t  zr/h.01t
mt607   h/zr.01t  zr/h.01t
mt608   h/zr.01t  zr/h.01t
mt609   h/zr.01t  zr/h.01t
mt611   h/zr.01t  zr/h.01t
mt612   h/zr.01t  zr/h.01t
mt613   h/zr.01t  zr/h.01t
mt614   h/zr.01t  zr/h.01t
mt615   h/zr.01t  zr/h.01t
mt616   h/zr.01t  zr/h.01t
mt617   h/zr.01t  zr/h.01t
mt618   h/zr.01t  zr/h.01t
mt619   h/zr.01t  zr/h.01t
mt620   h/zr.01t  zr/h.01t
mt621   h/zr.01t  zr/h.01t
mt622   h/zr.01t  zr/h.01t
mt623   h/zr.01t  zr/h.01t
mt624   h/zr.01t  zr/h.01t
mt625   h/zr.01t  zr/h.01t
mt626   h/zr.01t  zr/h.01t
mt627   h/zr.01t  zr/h.01t
mt628   h/zr.01t  zr/h.01t
mt629   h/zr.01t  zr/h.01t
mt630   h/zr.01t  zr/h.01t
mt700   h/zr.01t  zr/h.01t
mt2     grph.01T
mt6     lwtr.01
c ************************* TALLY SPECIFICATION ********************************
c Flux average tally for active fuel region of all 85 elements
c FUEL ELEMENT ORDER IMPORTANT
f4:n  20112 20113 20114 20115 20116 20117 20118 20119 20212 20213 &
      20214 20215 20216 20217 20218 20219 20312 20313 20314 20315 &
      20316 20317 20318 20319 20412 20413 20414 20415 20416 20417 &
      20418 20419 20512 20513 20514 20515 20516 20517 20518 20519 &
      20612 20613 20614 20615 20616 20617 20618 20619 30112 30113 &
      30114 30115 30116 30117 30118 30119 30212 30213 30214 30215 &
      30216 30217 30218 30219 30312 30313 30314 30315 30316 30317 &
      30318 30319 30412 30413 30414 30415 30416 30417 30418 30419 &
      30512 30513 30514 30515 30516 30517 30518 30519 30612 30613 &
      30614 30615 30616 30617 30618 30619 30812 30813 30814 30815 &
      30816 30817 30818 30819 30912 30913 30914 30915 30916 30917 &
      30918 30919 31012 31013 31014 31015 31016 31017 31018 31019 &
      31112 31113 31114 31115 31116 31117 31118 31119 31212 31213 &
      31214 31215 31216 31217 31218 31219 40112 40113 40114 40115 &
      40116 40117 40118 40119 40212 40213 40214 40215 40216 40217 &
      40218 40219 40312 40313 40314 40315 40316 40317 40318 40319 &
      40512 40513 40514 40515 40516 40517 40518 40519 40612 40613 &
      40614 40615 40616 40617 40618 40619 40712 40713 40714 40715 &
      40716 40717 40718 40719 40812 40813 40814 40815 40816 40817 &
      40818 40819 40912 40913 40914 40915 40916 40917 40918 40919 &
      41012 41013 41014 41015 41016 41017 41018 41019 41112 41113 &
      41114 41115 41116 41117 41118 41119 41212 41213 41214 41215 &
      41216 41217 41218 41219 41312 41313 41314 41315 41316 41317 &
      41318 41319 41412 41413 41414 41415 41416 41417 41418 41419 &
      41512 41513 41514 41515 41516 41517 41518 41519 41712 41713 &
      41714 41715 41716 41717 41718 41719 41812 41813 41814 41815 &
      41816 41817 41818 41819 50212 50213 50214 50215 50216 50217 &
      50218 50219 50312 50313 50314 50315 50316 50317 50318 50319 &
      50412 50413 50414 50415 50416 50417 50418 50419 50512 50513 &
      50514 50515 50516 50517 50518 50519 50612 50613 50614 50615 &
      50616 50617 50618 50619 50712 50713 50714 50715 50716 50717 &
      50718 50719 50812 50813 50814 50815 50816 50817 50818 50819 &
      50912 50913 50914 50915 50916 50917 50918 50919 51012 51013 &
      51014 51015 51016 51017 51018 51019 51112 51113 51114 51115 &
      51116 51117 51118 51119 51212 51213 51214 51215 51216 51217 &
      51218 51219 51312 51313 51314 51315 51316 51317 51318 51319 &
      51412 51413 51414 51415 51416 51417 51418 51419 51512 51513 &
      51514 51515 51516 51517 51518 51519 51612 51613 51614 51615 &
      51616 51617 51618 51619 51712 51713 51714 51715 51716 51717 &
      51718 51719 51812 51813 51814 51815 51816 51817 51818 51819 &
      51912 51913 51914 51915 51916 51917 51918 51919 52012 52013 &
      52014 52015 52016 52017 52018 52019 52112 52113 52114 52115 &
      52116 52117 52118 52119 52212 52213 52214 52215 52216 52217 &
      52218 52219 52312 52313 52314 52315 52316 52317 52318 52319 &
      52412 52413 52414 52415 52416 52417 52418 52419 60112 60113 &
      60114 60115 60116 60117 60118 60119 60212 60213 60214 60215 &
      60216 60217 60218 60219 60312 60313 60314 60315 60316 60317 &
      60318 60319 60412 60413 60414 60415 60416 60417 60418 60419 &
      60512 60513 60514 60515 60516 60517 60518 60519 60612 60613 &
      60614 60615 60616 60617 60618 60619 60712 60713 60714 60715 &
      60716 60717 60718 60719 60812 60813 60814 60815 60816 60817 &
      60818 60819 60912 60913 60914 60915 60916 60917 60918 60919 &
      61112 61113 61114 61115 61116 61117 61118 61119 61212 61213 &
      61214 61215 61216 61217 61218 61219 61312 61313 61314 61315 &
      61316 61317 61318 61319 61412 61413 61414 61415 61416 61417 &
      61418 61419 61512 61513 61514 61515 61516 61517 61518 61519 &
      61612 61613 61614 61615 61616 61617 61618 61619 61712 61713 &
      61714 61715 61716 61717 61718 61719 61812 61813 61814 61815 &
      61816 61817 61818 61819 61912 61913 61914 61915 61916 61917 &
      61918 61919 62012 62013 62014 62015 62016 62017 62018 62019 &
      62112 62113 62114 62115 62116 62117 62118 62119 62212 62213 &
      62214 62215 62216 62217 62218 62219 62312 62313 62314 62315 &
      62316 62317 62318 62319 62412 62413 62414 62415 62416 62417 &
      62418 62419 62512 62513 62514 62515 62516 62517 62518 62519 &
      62612 62613 62614 62615 62616 62617 62618 62619 62712 62713 &
      62714 62715 62716 62717 62718 62719 62812 62813 62814 62815 &
      62816 62817 62818 62819 62912 62913 62914 62915 62916 62917 &
      62918 62919 63012 63013 63014 63015 63016 63017 63018 63019 
f7:n  20112 20113 20114 20115 20116 20117 20118 20119 20212 20213 &
      20214 20215 20216 20217 20218 20219 20312 20313 20314 20315 &
      20316 20317 20318 20319 20412 20413 20414 20415 20416 20417 &
      20418 20419 20512 20513 20514 20515 20516 20517 20518 20519 &
      20612 20613 20614 20615 20616 20617 20618 20619 30112 30113 &
      30114 30115 30116 30117 30118 30119 30212 30213 30214 30215 &
      30216 30217 30218 30219 30312 30313 30314 30315 30316 30317 &
      30318 30319 30412 30413 30414 30415 30416 30417 30418 30419 &
      30512 30513 30514 30515 30516 30517 30518 30519 30612 30613 &
      30614 30615 30616 30617 30618 30619 30812 30813 30814 30815 &
      30816 30817 30818 30819 30912 30913 30914 30915 30916 30917 &
      30918 30919 31012 31013 31014 31015 31016 31017 31018 31019 &
      31112 31113 31114 31115 31116 31117 31118 31119 31212 31213 &
      31214 31215 31216 31217 31218 31219 40112 40113 40114 40115 &
      40116 40117 40118 40119 40212 40213 40214 40215 40216 40217 &
      40218 40219 40312 40313 40314 40315 40316 40317 40318 40319 &
      40512 40513 40514 40515 40516 40517 40518 40519 40612 40613 &
      40614 40615 40616 40617 40618 40619 40712 40713 40714 40715 &
      40716 40717 40718 40719 40812 40813 40814 40815 40816 40817 &
      40818 40819 40912 40913 40914 40915 40916 40917 40918 40919 &
      41012 41013 41014 41015 41016 41017 41018 41019 41112 41113 &
      41114 41115 41116 41117 41118 41119 41212 41213 41214 41215 &
      41216 41217 41218 41219 41312 41313 41314 41315 41316 41317 &
      41318 41319 41412 41413 41414 41415 41416 41417 41418 41419 &
      41512 41513 41514 41515 41516 41517 41518 41519 41712 41713 &
      41714 41715 41716 41717 41718 41719 41812 41813 41814 41815 &
      41816 41817 41818 41819 50212 50213 50214 50215 50216 50217 &
      50218 50219 50312 50313 50314 50315 50316 50317 50318 50319 &
      50412 50413 50414 50415 50416 50417 50418 50419 50512 50513 &
      50514 50515 50516 50517 50518 50519 50612 50613 50614 50615 &
      50616 50617 50618 50619 50712 50713 50714 50715 50716 50717 &
      50718 50719 50812 50813 50814 50815 50816 50817 50818 50819 &
      50912 50913 50914 50915 50916 50917 50918 50919 51012 51013 &
      51014 51015 51016 51017 51018 51019 51112 51113 51114 51115 &
      51116 51117 51118 51119 51212 51213 51214 51215 51216 51217 &
      51218 51219 51312 51313 51314 51315 51316 51317 51318 51319 &
      51412 51413 51414 51415 51416 51417 51418 51419 51512 51513 &
      51514 51515 51516 51517 51518 51519 51612 51613 51614 51615 &
      51616 51617 51618 51619 51712 51713 51714 51715 51716 51717 &
      51718 51719 51812 51813 51814 51815 51816 51817 51818 51819 &
      51912 51913 51914 51915 51916 51917 51918 51919 52012 52013 &
      52014 52015 52016 52017 52018 52019 52112 52113 52114 52115 &
      52116 52117 52118 52119 52212 52213 52214 52215 52216 52217 &
      52218 52219 52312 52313 52314 52315 52316 52317 52318 52319 &
      52412 52413 52414 52415 52416 52417 52418 52419 60112 60113 &
      60114 60115 60116 60117 60118 60119 60212 60213 60214 60215 &
      60216 60217 60218 60219 60312 60313 60314 60315 60316 60317 &
      60318 60319 60412 60413 60414 60415 60416 60417 60418 60419 &
      60512 60513 60514 60515 60516 60517 60518 60519 60612 60613 &
      60614 60615 60616 60617 60618 60619 60712 60713 60714 60715 &
      60716 60717 60718 60719 60812 60813 60814 60815 60816 60817 &
      60818 60819 60912 60913 60914 60915 60916 60917 60918 60919 &
      61112 61113 61114 61115 61116 61117 61118 61119 61212 61213 &
      61214 61215 61216 61217 61218 61219 61312 61313 61314 61315 &
      61316 61317 61318 61319 61412 61413 61414 61415 61416 61417 &
      61418 61419 61512 61513 61514 61515 61516 61517 61518 61519 &
      61612 61613 61614 61615 61616 61617 61618 61619 61712 61713 &
      61714 61715 61716 61717 61718 61719 61812 61813 61814 61815 &
      61816 61817 61818 61819 61912 61913 61914 61915 61916 61917 &
      61918 61919 62012 62013 62014 62015 62016 62017 62018 62019 &
      62112 62113 62114 62115 62116 62117 62118 62119 62212 62213 &
      62214 62215 62216 62217 62218 62219 62312 62313 62314 62315 &
      62316 62317 62318 62319 62412 62413 62414 62415 62416 62417 &
      62418 62419 62512 62513 62514 62515 62516 62517 62518 62519 &
      62612 62613 62614 62615 62616 62617 62618 62619 62712 62713 &
      62714 62715 62716 62717 62718 62719 62812 62813 62814 62815 &
      62816 62817 62818 62819 62912 62913 62914 62915 62916 62917 &
      62918 62919 63012 63013 63014 63015 63016 63017 63018 63019 