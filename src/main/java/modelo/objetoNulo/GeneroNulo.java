package modelo.objetoNulo;

import persistencia.Genero;

public class GeneroNulo extends Genero{
	
	
	public GeneroNulo() {
		super("");
	}
	
	public static Genero construir() {
		return new GeneroNulo();
	}
	
	public boolean esNulo() {
		return true;
	}
}
