set BINARIAS;
set CONDICIONES;

param TABLA_VERDAD{condicion in CONDICIONES, binaria in BINARIAS};

var condicionesACumplir{condicion in CONDICIONES} binary >= 0;

maximize z: sum{condicion in CONDICIONES} condicionesACumplir[condicion];


s.t. debenSerCiertas{condicion in CONDICIONES}: condicionesACumplir[condicion] = 1;

end;
