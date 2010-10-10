package org.jggug.users

import org.jggug.simpleneo.*

/**
 * User Account Registration
 * @author Tsuyoshi Yamamoto
 * @since 2010/10/10 10:10:10
 */
class RegisterController {

    def springSecurityService

    def index = {
        if(springSecurityService.isLoggedIn()){
            redirect(action:'edit', params:[username:principal.username])
        }
    }

    def edit = {
        render(text:"")
    }

    def entry = {
        if(params.captcha == session.captcha){
            if(params.passwd == params.repasswd){
                String password = springSecurityService.encodePassword(params.passwd)
                Person person = new Person()
                person.username=params.username
                person.password=password
                person.userRealName=params.userRealName
                person.email=params.email
                person.enabled=false
                com.eaio.uuid.UUID u = new com.eaio.uuid.UUID()
                person.activateKey=u.toString()
                person.validate()
                if(person.validate()){
                    person.save(flush:true)
                    def roleUser = Authority.findByAuthority('ROLE_USER')
                    PersonAuthority.create person, roleUser, true
                    //TODO email to user
                    render(view:"success", model:[person:person])
                }else{
                    render(view:"index", model:[person:person,*:params])
                }
            }else{
                render(view:"index", model:params)
            }
        }else{
            flash.message ="${message(code: 'registration.code.notmatch', default: 'Enter Code did not match.')}"
            render(view:"index", model:params)
        }
    }

    def userCache
    def activate = {
        if(!params.id){
            flash.message ="${message(code: 'registration.activate.notfound', default: 'Activate Key Not Found.')}"
            return [css:'error']
        }
        def user = Person.findByActivateKey(params.id)
        if(user){
            user.enabled=true
            user.activateKey=''
            user.save(flush:true)
            userCache.removeUserFromCache user.username

            flash.message ="${message(code: 'registration.activate.success', default: 'Account Activated.')}"
            [css:'',success:true]
        }else{
            flash.message ="${message(code: 'registration.activate.notfound', default: 'Activate Key Not Found.')}"
            [css:'error']
        }
    }
}
