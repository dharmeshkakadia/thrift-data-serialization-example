package org.example;

import org.apache.thrift.TBase;
import org.apache.thrift.TException;
import org.apache.thrift.TSerializer;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.TSimpleJSONProtocol;
import org.apache.thrift.TException;

import org.example.Event;
import org.example.State;
import org.example.EventName;

public class EventLogger {
  public static void main(String[] args){
    // TSerializer binarySearializer = new TSerializer(new TBinaryProtocol.Factory()); // can be used as compressed binary transport
    TSerializer jsonSearializer = new TSerializer(new TSimpleJSONProtocol.Factory()); // can be used to generate JSON payload
    Event event = new Event();
    //If you dont provide required parameters such as eventName, you will get 
    // org.apache.thrift.protocol.TProtocolException: Required field 'eventName' was not present! 
    event.eventName = EventName.GOOD; // you can use = operator 
    event.setVersion(1);                   // or use set methods
    event.state = State.RECIEVED;
    
    try{      
      String json = jsonSearializer.toString(event); // should produce {"eventName":1,"version":1,"state":0}
      System.out.println(json);
    } catch(TException e){
      System.err.println("Error searializing : " + e);
    }

  }
}
