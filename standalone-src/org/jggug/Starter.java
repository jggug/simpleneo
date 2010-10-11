/*
 * Copyright 2009 Qbranch AB
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.jggug;

import org.mortbay.jetty.Connector;
import org.mortbay.jetty.Server;
import org.mortbay.jetty.bio.SocketConnector;
import org.mortbay.jetty.webapp.WebAppContext;

import java.net.URL;
import java.security.ProtectionDomain;

/**
 * Starter for embedded Jetty. This class is intended to be packaged into a
 * war-file and set as the Main-Class in MANIFEST.MF. Running the war will
 * start a Jetty instance on port 8080 with the containing war loaded.
 * If you specify a port environment variable that will be used for Jetty
 * instead of 8080 (see example).
 *
 * The base of this class comes from this blogpost:
 * http://eclipsesource.com/blogs/2009/10/02/executable-wars-with-jetty/
 *
 * Example:
 * java -jar -Dport=80 webapp.war
 *
 * webapp.war is loaded on http://localhost:8080/
 *
 * @author Leonard Axelsson
 */
public class Starter {
    
    private static final int DEFAULT_PORT = 8081;

    public static void main(String[] args) throws Exception {
        Server server = new Server();
        SocketConnector connector = new SocketConnector();
        connector.setMaxIdleTime(1000 * 60 * 60);
        connector.setSoLingerTime(-1);
        connector.setPort(Integer.getInteger("port", DEFAULT_PORT));
        server.setConnectors(new Connector[]{connector});

        WebAppContext context = new WebAppContext();
        context.setServer(server);
        context.setContextPath("/simpleneo");

        ProtectionDomain protectionDomain = Starter.class.getProtectionDomain();
        URL location = protectionDomain.getCodeSource().getLocation();
        context.setWar(location.toExternalForm());

        server.addHandler(context);
        try {
            server.start();
            server.join();
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(100);
        }

    }
}
