package grails3primefaces

import com.prominic.PrimeUI

class BootStrap {

    def init = { servletContext ->
        // derived from:  https://msdn.microsoft.com/en-us/library/ms762271(v=vs.85).aspx
        def books = [
           [
              author:'Gambardella, Matthew',
              title:'XML Developer\'s Guide',
              releaseYear:'2000',
              description:'An in-depth look at creating applications with XML.'
           ],
           [
              author:'Ralls, Kim',
              title:'Midnight Rain',
              releaseYear:'2000',
              description:'A former architect battles corporate zombies, an evil sorceress, and her own childhood to become queen of the world.'
           ],
           [
              author:'Corets, Eva',
              title:'Maeve Ascendant',
              releaseYear:'2000',
              description:'After the collapse of a nanotechnology society in England, the young survivors lay the foundation for a new society.'
           ],
           [
              author:'Corets, Eva',
              title:'Oberon\'s Legacy',
              releaseYear:'2001',
              description:'In post-apocalypse England, the mysterious agent known only as Oberon helps to create a new life for the inhabitants of London. Sequel to Maeve Ascendant.'
           ],
           [
              author:'Corets, Eva',
              title:'The Sundered Grail',
              releaseYear:'2001',
              description:'The two daughters of Maeve, half-sisters, battle one another for control of England. Sequel to Oberon\'s Legacy.'
           ],
           [
              author:'Randall, Cynthia',
              title:'Lover Birds',
              releaseYear:'2000',
              description:'When Carla meets Paul at an ornithology conference, tempers fly as feathers get ruffled.'
           ],
           [
              author:'Thurman, Paula',
              title:'Splish Splash',
              releaseYear:'2000',
              description:'A deep sea diver finds true love twenty thousand leagues beneath the sea.'
           ],
           [
              author:'Knorr, Stefan',
              title:'Creepy Crawlies',
              releaseYear:'2000',
              description:'An anthology of horror stories about roaches, centipedes, scorpions  and other insects.'
           ],
           [
              author:'Kress, Peter',
              title:'Paradox Lost',
              releaseYear:'2000',
              description:'After an inadvertant trip through a Heisenberg Uncertainty Device, James Salway discovers the problems of being quantum.'
           ],
           [
              author:'O\'Brien, Tim',
              title:'Microsoft .NET: The Programming Bible',
              releaseYear:'2000',
              description:'Microsoft\'s .NET initiative is explored in detail in this deep programmer\'s reference.'
           ],
           [
              author:'O\'Brien, Tim',
              title:'MSXML3: A Comprehensive Guide',
              releaseYear:'2000',
              description:'The Microsoft MSXML3 parser is covered in detail, with attention to XML DOM interfaces, XSLT processing, SAX and more.'
           ],
           [
              author:'Galos, Mike',
              title:'Visual Studio 7: A Comprehensive Guide',
              releaseYear:'2001',
              description:'Microsoft Visual Studio 7 is explored in depth, looking at how Visual Basic, Visual C++, C#, and ASP+ are integrated into a comprehensive development environment.'
           ],
        ]

        books.each { properties ->
            PrimeUI book = new PrimeUI(properties)
            book.save(flush:true, failOnError:true)
        }


    }
    def destroy = {
    }
}
