package com.ky.gps.sys;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ky.gps.sys.EchoServer;

import java.net.ServerSocket;


/**
 * 主线程
 * 
 * @author Rocky
 *
 */
public class StartThread implements Runnable {

	private final static Logger LOGGER = LoggerFactory.getLogger(StartThread.class);
	
	public StartThread() {
		
	}

	@Override
	public void run() {
		ServerSocket serverSocket = null;
		
		
		int GPSprot = 20086;
//		System.out.println("-------------监听端口GPSport: "+GPSprot+"-------------");
		LOGGER.info("-------------监听端口GPSport: "+GPSprot+"-------------");
		
		EchoServer echoServer = new EchoServer();
		try {
			
			//---------------------------------------------------------------//
			echoServer.setPort(GPSprot);
			echoServer.init();
			//---------------------------------------------------------------//
			try {
				echoServer.bind();
			} catch (InterruptedException e) {
				LOGGER.error("",e);
			}
		} catch (Exception e) {
			LOGGER.error("",e);
		}finally {
			if (echoServer != null) {
				echoServer.shutdown();
			}
		}
		
		/*
		 * 创建服务器，开启守护线程 
		 */
//		NIOServerSocket nss = new NIOServerSocket(GPSprot);
//		try {
//			
//			nss.start();
//				
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			if (nss != null) {
//				nss.shutdown();
//			}
//		}
	}
}
