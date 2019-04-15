package com.ky.gps.sys;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;


/**
 * 主线程
 * 
 * @author Alienware-Rocky
 *
 */


public class StartThread implements Runnable {
	
	
	public StartThread() {
		
	}

	@Override
	public void run() {
		ServerSocket serverSocket = null;
		
		
		int GPSprot = 8001;
		System.out.println("-------------监听端口GPSport: "+GPSprot+"-------------");
		
		/*
		 * 创建服务器，开启守护线程 
		 */
		NIOServerSocket nss = new NIOServerSocket(GPSprot);
		try {
			
			nss.start();
				
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (nss != null) {
				nss.shutdown();
			}
		}
	}
}