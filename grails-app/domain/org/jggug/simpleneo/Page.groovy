package org.jggug.simpleneo

/**
 * Domain class for the wiki page
 * @author Tsuyoshi Yamamoto
 * @since 2010/10/11 13:38:25
 */
class Page {

    static hasMany = [pages:Page]
    static belongsTo = [page:Page]

    /** parent page */
    Page page
    /** page title */
    String title
    /** content */
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

    //TODO: remove (hasMany) some day....
    //Set<Page> getPages() {
    //    PagePage.findAllByPage(this).collect { it.child } as Set
    //}
}
