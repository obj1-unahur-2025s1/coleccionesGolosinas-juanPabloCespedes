object bombon {
  var peso = 15
  method peso() = peso
  method peso(unPeso){peso = unPeso}
  method gusto() = frutilla
  method esLibreDeGluten() = true
  method valor()= 5
  method mordisco(){peso = (peso - (peso*0.20 + 1)).max(0)}

  
}
object alfajor {
  var peso = 300
  method peso() = peso
  method peso(unPeso){peso = unPeso}
  method gusto() = chocolate
  method esLibreDeGluten() = false
  method valor()= 12
  method mordisco(){peso = (peso - (peso*0.20)).max(0)}

  
}
object caramelo {
  var peso = 5
  method peso() = peso
  method peso(unPeso){peso = unPeso}
  method gusto() = frutilla
  method esLibreDeGluten() = true
  method valor()= 1
  method mordisco(){peso = (peso - 1).max(0)}

  
}
object chupetin {
  var peso = 0
  var precioInicial= 0
  method peso() = peso
  method peso(unPeso){peso = unPeso precioInicial = unPeso}
  method gusto() = chocolate
  method esLibreDeGluten() = false
  method valor()= 0.50 * precioInicial
  method mordisco(){peso = (peso - 2).max(0)}

  
}
object oblea {
  var peso = 250
  
  method peso() = peso
  method peso(unPeso){peso = unPeso precioInicial = unPeso}
  method gusto() = vainilla
  method esLibreDeGluten() = false
  method valor()= 5
  method mordisco(){if(peso>70) peso = peso / 2 else peso = (peso- (peso*0.25)).max(0)}
}
object golosinaBaniada {
  var peso = golosinaBase.peso() + 4
  var golosinaBase = caramelo
    method golosinaBase(golosina)  {golosinaBase = golosina}
  method peso() = peso
  method peso(unPeso){peso = unPeso}
  method gusto() = golosinaBase.gusto()
  method esLibreDeGluten() = golosinaBase.esLibreDeGluten()
  method valor()= golosinaBase.valor()+ 2
  method mordisco(){peso = (peso - 2).max(0) golosinaBase.mordisco()}
}
object pastillaTutiFrutti {
  var peso = 5
  var libreDeGluten = false
  var gusto = frutilla
  method gusto(sabor){gusto = sabor}
  method peso() = peso
  method peso(unPeso){peso = unPeso}
  method gusto() = gusto
  method esLibreDeGluten() = libreDeGluten
  method esLibreDeGluten(valor){libreDeGluten = valor}
  method valor()= 7 + if(self.esLibreDeGluten()) 0 else 3
  method mordisco(){gusto = gusto.cambiarGusto()}
}
object frutilla {
  method cambiarGusto()= chocolate
}
object chocolate {
  method cambiarGusto()= naranja
}
object naranja {
  method cambiarGusto()= frutilla
}
object mariano {
  const bolsaDeGolosinas = []
  method comprar(unaGolosina)= bolsaDeGolosinas.add(unaGolocina)
  method desechar(unaGolosina)= bolsaDeGolosinas.remove(unaGolosina)
  method cantidadDeGolosinas() = bolsaDeGolosinas.size()
  method tieneGolosina(unaGolosina)= bolsaDeGolosinas.contains(unaGolosina)
  method probarGolosinas()= if(!bolsaDeGolosinas.isEmpty())bolsaDeGolosinas.forEach({e=>e.mordisco()})
  method hayGolosinasSinTacc()= bolsaDeGolosinas.any({e=>e.esLibreDeGluten()})
  method preciosCuidados()=bolsaDeGolosinas.all({e=>e.valor() <=10})
  method hayGolosinaDeSabor(unSabor)= bolsaDeGolosinas.any({e=>e.gusto()== unSabor})
  method golosinaDeSabor(unSabor)= if(self.hayGolosinaDeSabor(unSabor)) bolsaDeGolosinas.find({e=>e.gusto()== unSabor})
  method golosinasDeSabor(unSabor)= bolsaDeGolosinas.filter({e=>e.gusto() == unSabor})
  method sabores()= bolsaDeGolosinas.map({e=>e.gusto()}).asSet()
  method golosinaMasCara()= if(!bolsaDeGolosinas.isEmpty())bolsaDeGolosinas.max({e=>e.valor()})
  method pesoGolosinas()= bolsaDeGolosinas.sum({e=>e.peso()})

  method golosinasFaltantes(golosinasDeseadas)= golosinasDeseadas.asSet().difference(bolsaDeGolosinas.asSet()) 

  method gustosFaltantes(gustosDeseados)= gustosDeseados.filter({e=>!self.tieneGolosinaDeSabor(e)})
  method tieneGolosinaDeSabor(sabor)= bolsaDeGolosinas.any({e=>e.gusto() == sabor})
	
  method cantidadDeGolosinasDeSabor(sabor)= bolsaDeGolosinas.count({e=>e.gusto()==sabor})

  method cantidadDePesoGolosinasDeSabor(sabor)= bolsaDeGolosinas.sum({e=>e.peso() e.gusto()==sabor})

  method gastoEnSabor(sabor)= bolsaDeGolosinas.sum({e=>e.valor() sabor == e.gusto()})
  method saborMasPesado()= bolsaDeGolosinas.max({e=>self.cantidadDePesoGolosinasDeSabor(e.gusto())})

}