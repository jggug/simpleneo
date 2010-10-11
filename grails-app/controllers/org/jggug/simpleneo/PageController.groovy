package org.jggug.simpleneo

import static org.codehaus.groovy.grails.commons.ConfigurationHolder.config as config
import java.net.URLDecoder
import java.net.URLEncoder

class PageController {
    def wikiEngine
    def wikiContext
    def springSecurityService

    /**
     * タイトルでページを検索
     * UrlMapping "/display/$id"(controller:"page", action:"findByTitle")
     */
    def findByTitle = {
        def toppage = config.simple?.contents?.toppage?:'top'
        Page page
        if(params.pageId){
            page = Page.get(params.pageId)
        }else{
            def title = params.id?:toppage
            page = Page.findByTitle( title )
        }
        if(!page) {
            page = Page.findByTitle( toppage )
        }

        if(page) {
            render(view:'show', model:[page : page])
        } else {
            if(springSecurityService.isLoggedIn()) flash.message='Top page not found. Please Create the top page wiki.'
            redirect(action:createPage,params:[name:toppage])
        }
    }

    def createPage = {
        if(!springSecurityService.isLoggedIn()){
            redirect(uri:'/')
            return
        }

        def page = new Page()
        if(params['addChildTo']!='') page.page=Page.get(params.addChildTo)
        page.title = params.name!='new'?params.name:''
        render(view:'editPage', model:[page:page, mode:'create'])
    }

    def save = {
        if(springSecurityService.isLoggedIn()){
            Page page
            boolean isNew=false
            if(params.id){
                page = Page.get( params.id )
            }else{
                page = new Page()
                isNew=true
            }
            page.properties = params
            page.updated = Person.get(principal.id)
            if(isNew) page.created = Person.get(principal.id)

            if(page.validate()){
                page.save(flush:true)
                flash.message = "Page ${page.title} created"
                redirect(uri:"${createLink(url:'/display')}/${page.title.encodeAsURL()}")
            } else {
                render(view:'editPage', model:[page:page, mode:'create'])
            }
        }else{
            redirect(uri:'/')
        }
    }

    def editPage = {
        if(!springSecurityService.isLoggedIn()){
            redirect(uri:'/')
            return
        }
        def page = Page.get( params.long('id') )
        if(!page) {
            flash.message = "Page not found with id ${params.id}"
            redirect(uri:'/')
        }else {
            render(view:"editPage", model:[page : page,mode:"edit"])
        }
    }

    /** 編集プレビュー表示用 */
    def preview={
        render text:wiki.show(pageId:"0"){params.body}
    }
}
