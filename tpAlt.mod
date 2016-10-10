set BINARIAS;
set TIPO;
set CONDICIONES;

/* tablas que voy a usar de mi .dat*/
param TABLA_VERDAD{tipo in TIPO, binaria in BINARIAS, condicion in CONDICIONES};

/*declaracion de todas las variables que voy a usar*/
var condicionesACumplir{condicion in CONDICIONES} binary >= 0;
var binariasTodas{tipo in TIPO, binaria in BINARIAS} binary >= 0;

/*funcional*/
maximize z: sum{condicion in CONDICIONES} condicionesACumplir[condicion];

/*restricciones del problema*/
s.t. debenSerCiertas{condicion in CONDICIONES}: condicionesACumplir[condicion] = 1;
s.t. condicionesOrLadoIzquierdo{condicion in CONDICIONES}: sum{tipo in TIPO, binaria in BINARIAS} TABLA_VERDAD[tipo, binaria, condicion] * binariasTodas[tipo, binaria] >= condicionesACumplir[condicion];

s.t. condicionesOrLadoDerecho{condicion in CONDICIONES}: sum{tipo in TIPO, binaria in BINARIAS} TABLA_VERDAD[tipo, binaria, condicion] * binariasTodas[tipo, binaria] <= (sum{tipo in TIPO, binaria in BINARIAS} TABLA_VERDAD[tipo, binaria, condicion]) * condicionesACumplir[condicion];

s.t. relacionarNormalesConSuNegada{binaria in BINARIAS}: sum{tipo in TIPO} binariasTodas[tipo, binaria] = 1;
end;
