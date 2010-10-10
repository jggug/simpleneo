import org.jggug.simpleneo.*

class BootStrap {

    def springSecurityService

    def init = { servletContext ->
        if(Person.count()==0){
            def adminRole = new Authority(authority: 'ROLE_ADMIN',name:'管理者').save(flush: true)
            def userRole = new Authority(authority: 'ROLE_USER',name:'一般ユーザ').save(flush: true)
            assert Authority.count() == 2

            String password = springSecurityService.encodePassword('pass')
            def admin = new Person(username:'admin', enabled:true, password:password,userRealName:'管理者', email:'sysml@xmldo.jp').save(flush: true)
            def user = new Person(username:'user', enabled:true, password:password,userRealName:'一般ユーザ', email:'sysml@xmldo.jp').save(flush: true)
            assert Person.count() == 2

            PersonAuthority.create admin, adminRole, true
            PersonAuthority.create admin, userRole, true
            PersonAuthority.create user, userRole, true
            assert PersonAuthority.count() == 3
        }
    }
    def destroy = {
    }
}
