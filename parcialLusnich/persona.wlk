
class Persona{
    var edad = 15
    var emociones = #{}
    var property emocionActiva //PARA VERIFICAR LOS TESTS
// --------------- 1 ----------------
    method esAdolescente() = edad.between(12, 19)
// --------------- 2 ---------------
    method nuevaEmocion(emocion) = emociones.add(emocion)
// --------------- 3 ---------------    
    method estaPorExplotar(evento) = emociones.all().map({emo => emo.liberarse(evento)})
// --------------- 4 ---------------
    method vivirEvento(evento) = emociones.forEach({emo => emo.liberarse(evento)})

    
}
// -------------- 6 ----------------
class GrupoPersonas{
    var grupo = #{}

    method vivirEvento(evento) = grupo.forEach({integrante => integrante.vivirEvento(evento)})
}

class Evento{
    var property impacto
    var property descripcion
}

class Emocion{
    var intensidadElevada = 20
    var intensidad = 100
    var cantEventos = 200

    method cantEventos() = cantEventos
    method intensidad() = intensidad
    method intensidadAlta() = intensidadElevada < intensidad
// ------------ 5 -------------
    method modificarIntElevada(valor){
        intensidadElevada = valor
    }
    method liberarse(evento) 
}

object furia inherits Emocion{
    var palabrotas = #{}

    override method intensidad() = 100

    override method liberarse(evento) {
      if((self.intensidadAlta()) or (self.conocePalabra7())){
        intensidad -= evento.impacto()
        palabrotas.asList().remove(palabrotas.first())
        cantEventos += 1
      }
    }

    method conocePalabra7() = palabrotas.any({palabra => palabra.size() >= 7})
}

object alegria inherits Emocion{

    override method liberarse(evento) {
      if(self.intensidadAlta() and (cantEventos.even())){
        intensidad -= evento.impacto()
        cantEventos += 1
        if(intensidad < 0){
            intensidad = -intensidad
        }
      }
    }
}

object tristeza inherits Emocion{
    var causa = melancolia

    override method liberarse(evento){
        if(self.intensidadAlta()){
            intensidad -= evento.impacto()
            causa = evento.descripcion()
            cantEventos += 1

        }
    }
}

object melancolia {
  
}

object desagrado inherits Emocion{

    override method liberarse(evento) {
      if(self.intensidadAlta() and (cantEventos > intensidad)){
        intensidad -= evento.impacto()
        cantEventos += 1
      }
    }
}

object temor inherits Emocion{

    override method liberarse(evento) {
      if(self.intensidadAlta() and (cantEventos > intensidad)){
        intensidad -= evento.impacto()
        cantEventos += 1
      }
    }
}

object ansiedad inherits Emocion{
    var cantFinalesPendientes = 5
    var finalDeAlgebraPendiente = true 

    override method liberarse(evento) {
      if(self.intensidadAlta() and (cantFinalesPendientes > 4) and (finalDeAlgebraPendiente)){
        intensidad -= evento.impacto()
      } 
    }

}

//EL POLIMORFISMO Y LA HERENCIA NOS SIRVEN EN LA ESTRUCTURACION DEL PROGRAMA PARA NO TENER QUE REPETIR CODIGO Y QUE LOS METODOS Y 
//VARIABLES SE RELACIONEN ENTRE SI POR MAS QUE NO ESTEN EN LA MISMA CLASE U OBJETO


