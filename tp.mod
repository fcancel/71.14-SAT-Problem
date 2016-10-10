set BINARIAS;
set CONDICIONES;
set RELACIONES;

/* tablas que voy a usar de mi .dat*/
param TABLA_VERDAD{condicion in CONDICIONES, binaria in BINARIAS};
param TABLA_RELACION_NEGADA{relacion in RELACIONES, binaria in BINARIAS};

/*declaracion de todas las variables que voy a usar*/
var condicionesACumplir{condicion in CONDICIONES} binary >= 0;
var binariasTodas{binaria in BINARIAS} binary >= 0;

/*funcional*/
maximize z: sum{condicion in CONDICIONES} condicionesACumplir[condicion];

/*restricciones del problema*/
s.t. debenSerCiertas{condicion in CONDICIONES}: condicionesACumplir[condicion] = 1;
s.t. condicionesOrLadoIzquierdo{condicion in CONDICIONES}: sum{binaria in BINARIAS} TABLA_VERDAD[condicion, binaria] * binariasTodas[binaria] >= condicionesACumplir[condicion];
s.t. condicionesOrLadoDerecho{condicion in CONDICIONES}: sum{binaria in BINARIAS} TABLA_VERDAD[condicion, binaria] * binariasTodas[binaria] <= (sum{binaria in BINARIAS} TABLA_VERDAD[condicion, binaria]) * condicionesACumplir[condicion];

s.t. relacionarNormalesConSuNegada{relacion in RELACIONES}: sum{binaria in BINARIAS} TABLA_RELACION_NEGADA[relacion, binaria] * binariasTodas[binaria] = 1;
end;
