# taiesm1_nudging
created: Dec 27, 2024
This is the code base for nudging utility for TaiESM1.
The original code is from NCAR for CESM1.0.

fortran code:
namelist setup: 

Reference: 
Ma et al. (2015):

## Nudging forcing ##
A set of forcing from reanalysis is necessary.
An example for nudging dataset is as following:
big:  /lfs/home/ychwang/DATA_NUDGE_ERAITM/

netcdf interim_fv_2011062600_2011062618_TQUSVS.nc.n3 {
dimensions:
        lon = 288 ;
        lat = 192 ;
        slon = 288 ;
        slat = 191 ;
        lev = 30 ;
        ilev = 31 ;
        time = UNLIMITED ; // (4 currently)
variables:
        float T(time, lev, lat, lon) ;
                T:long_name = "temperature" ;
                T:units = "K" ;
        float Q(time, lev, lat, lon) ;
                Q:long_name = "specific humidity" ;
                Q:units = "kg/kg" ;
        float US(time, lev, slat, lon) ;
                US:long_name = "zonal wind, staggered" ;
                US:units = "m/s" ;
        float U(time, lev, lat, lon) ;
                U:long_name = "zonal wind component" ;
                U:units = "m/s" ;
        float VS(time, lev, lat, slon) ;
                VS:long_name = "meridional wind, staggered" ;
                VS:units = "m/s" ;
        float V(time, lev, lat, lon) ;
                V:long_name = "meridional wind component" ;
                V:units = "m/s" ;
        float PS(time, lat, lon) ;
                PS:long_name = "surface pressure" ;
                PS:units = "Pa" ;
        float PSUS(time, slat, lon) ;
                PSUS:long_name = "surface pressure on US grid" ;
                PSUS:units = "Pa" ;
        float PSVS(time, lat, slon) ;
                PSVS:long_name = "surface pressure on VS grid" ;
                PSVS:units = "Pa" ;
        float PHIS(time, lat, lon) ;
                PHIS:long_name = "surface geopotential" ;
                PHIS:units = "m2/s2" ;
        float lon(lon) ;
                lon:long_name = "longitude" ;
                lon:units = "degrees_east" ;
        float lat(lat) ;
                lat:long_name = "latitude" ;
                lat:units = "degrees_north" ;
        float slon(slon) ;
                slon:long_name = "staggered longitude" ;
                slon:units = "degrees_east" ;
        float slat(slat) ;
                slat:long_name = "staggered latitude" ;
                slat:units = "degrees_north" ;
        float lev(lev) ;
                lev:long_name = "hybrid level at layer midpoints (100*(A+B))" ;
                lev:units = "hybrid_sigma_pressure" ;
                lev:positive = "down" ;
                lev:A_var = "hyam" ;
                lev:B_var = "hybm" ;
                lev:P0_var = "P0" ;
                lev:PS_var = "PS" ;
                lev:edges = "ilev" ;
        float ilev(ilev) ;
                ilev:long_name = "hybrid level at layer interfaces (1000*(A+B))" ;
                ilev:units = "hybrid_sigma_pressure" ;
                ilev:positive = "down" ;
                ilev:A_var = "hyai" ;
                ilev:B_var = "hybi" ;
                ilev:P0_var = "P0" ;
                ilev:PS_var = "PS" ;
        float hyam(lev) ;
                hyam:long_name = "hybrid A coefficient at layer midpoints" ;
        float hybm(lev) ;
                hybm:long_name = "hybrid B coefficient at layer midpoints" ;
        float hyai(ilev) ;
                hyai:long_name = "hybrid A coefficient at layer interfaces" ;
        float hybi(ilev) ;
                hybi:long_name = "hybrid B coefficient at layer interfaces" ;
        float P0 ;
                P0:long_name = "reference pressure" ;
                P0:units = "Pa" ;
        int ntrm ;
                ntrm:long_name = "spectral truncation parameter M" ;
        int ntrn ;
                ntrn:long_name = "spectral truncation parameter N" ;
        int ntrk ;
                ntrk:long_name = "spectral truncation parameter K" ;
        float gw(lat) ;
                gw:long_name = "gauss weights" ;
        float w_stag(slat) ;
                w_stag:long_name = "staggered latitude weights" ;
        float time(time) ;
                time:long_name = "simulation time" ;
                time:units = "days since 2011-6-26 0:00:00" ;
                time:calendar = "gregorian" ;
        int ndbase ;
                ndbase:long_name = "base day for this case" ;
        int nsbase ;
                nsbase:long_name = "seconds to complete base day" ;
        int nbdate ;
                nbdate:long_name = "base date (YYYYMMDD)" ;
        int nbsec ;
                nbsec:long_name = "seconds to complete base date" ;
        int date(time) ;
                date:long_name = "current date (YYYYMMDD)" ;
        int datesec(time) ;
                datesec:long_name = "seconds to complete current date" ;
                datesec:units = "seconds" ;
}

