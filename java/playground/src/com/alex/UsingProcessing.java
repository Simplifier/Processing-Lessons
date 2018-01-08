package com.alex;

import processing.awt.PSurfaceAWT.SmoothCanvas;
import processing.core.PApplet;
import processing.core.PSurface;

import javax.swing.*;

public class UsingProcessing extends PApplet {
	public static void main(String[] args) {
		//create your JFrame
		JFrame frame = new JFrame("JFrame Test");
		frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);

		//create your sketch
		UsingProcessing pt = new UsingProcessing();

		//get the PSurface from the sketch
		PSurface ps = pt.initSurface();

		//initialize the PSurface
		ps.setSize(400, 300);

		//get the SmoothCanvas that holds the PSurface
		SmoothCanvas smoothCanvas = (SmoothCanvas)ps.getNative();

		//SmoothCanvas can be used as a Component
		//frame.add(smoothCanvas);

		//make your JFrame visible
		frame.setSize(400, 400);

		frame.setVisible(true);

		//start your sketch
		ps.startThread();

		JPanel panel = new JPanel();
		panel.setLocation(0, 300);
		//frame.add(panel);

		//panel.add(new JLabel("Hello World"));
		frame.add(new Form1());
	}

	public void setup(){
		background(255, 255, 255);
		fill(100, 0, 255);
		ellipse(width/2,height/2,100,100);
	}
}
