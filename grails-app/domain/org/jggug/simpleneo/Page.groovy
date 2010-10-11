package org.jggug.simpleneo

class Page {

    static hasMany = [pages:Page]
    static belongsTo = [page:Page]

    Page page
    String title
    String body
    Date dateCreated
    Date lastUpdated

    Person created
    Person updated

    static constraints = {
        title(nullable:false,blank:false,unique:true)
        body(nullable:false,maxSize:9000000)
        page(nullable:true)
        created(nullable:true)
        updated(nullable:true)
    }

    String toString(){
        title
    }

    //Set<Authority> getPages() {
    //    PagePage.findAllByPage(this).collect { it.child } as Set
    //}
}
