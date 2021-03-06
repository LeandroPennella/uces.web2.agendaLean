package ar.edu.uces.web2.tphibernate.modelo.form;

import ar.edu.uces.web2.tphibernate.modelo.base.Usuario;
import oracle.sql.DATE;

import java.text.SimpleDateFormat;
import java.util.Date;

import ar.edu.uces.web2.tphibernate.modelo.base.Evento;
public class EventoForm {
	
	private String idEvento;
	private String titulo;
	private String fecha;
	private String horaInicio;
	private String horaFin;
	private String duracion;
	private Usuario usuarioActual;
	//private int eventosSimultaneos;
	private Usuario autor;
	
	
	public EventoForm() {}
	public EventoForm(Evento evento)
	{
		this.setIdEvento(Long.toString(evento.getId()));
		this.setTitulo(evento.getTitulo());
		SimpleDateFormat dateFormatter=new SimpleDateFormat("dd/MM/yyyy");
		this.setFecha(dateFormatter.format(evento.getFecha()));
		this.setHoraInicio(evento.getHoraInicio());
		this.setHoraFin(evento.getHoraFin());
		//this.setDuracion("");
		this.setUsuarioActual(evento.getUsuarioActual());
		this.setAutor(evento.getAutor());
		
	}
	
	public String getIdEvento() {
		return idEvento;
	}
	public void setIdEvento(String idEvento) {
		this.idEvento = idEvento;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public String getHoraInicio() {
		return horaInicio;
	}
	public void setHoraInicio(String horaInicio) {
		this.horaInicio = horaInicio;
	}
	public String getHoraFin() {
		return horaFin;
	}
	public void setHoraFin(String horaFin) {
		this.horaFin = horaFin;
	}
	public String getDuracion() {
		return duracion;
	}
	public void setDuracion(String duracion) {
		this.duracion = duracion;
	}

	public Usuario getUsuarioActual() {
		return usuarioActual;
	}
	public void setUsuarioActual(Usuario usuarioActual) {
		this.usuarioActual = usuarioActual;
	}
	
	/*
	public int getEventosSimultaneos() {
		return eventosSimultaneos;
	}
	public void setEventosSimultaneos(int eventosSimultaneos) {
		this.eventosSimultaneos = eventosSimultaneos;
	}
	*/
	
	public int obtenerMinutosDuracion() {
		//TODO: mover a evento
	
		String[] hI = this.horaInicio.split(":");
		String[] hF = this.horaFin.split(":");
	
		int horaInicioenMinutos = (Integer.parseInt(hI[0])*60 + Integer.parseInt(hI[1]));
		int horaFinenMinutos = (Integer.parseInt(hF[0])*60 + Integer.parseInt(hF[1]));
	
		int minutos=horaFinenMinutos-horaInicioenMinutos;
		if (minutos<0) {minutos+=24*60;}
		
		return minutos;
		
	}
	
	public String obtenerEstado(Usuario usuario){return "evento";}
	
	public Usuario getAutor() {
		return autor;
	}
	public void setAutor(Usuario autor) {
		this.autor = autor;
	}
}
