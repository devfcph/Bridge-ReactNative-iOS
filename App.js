import React, { Component } from "react";
import { Platform, View, Text, NativeModules, TouchableOpacity } from "react-native";

const HelloWorld = NativeModules.HelloWorldModule;

export default class App extends Component{
  render(){
    return(
      <View style={{flex:1, alignItems: "center", justifyContent:'center'}}>
        <TouchableOpacity onPress={()=>{
          if(Platform.OS == "android"){
            NativeModules.HelloWorldModule.ShowMessage("This is first time we are creating bridge. :)", 5000);
          }
          else if(Platform.OS == "ios"){
            NativeModules.HelloWorld.ShowMessage("HOLA, SI S PUDO DESDE LA VERSIÓN 0.67.3 :)", 15.5);
          }
        }}>
          <Text>Pushéame!</Text>


        </TouchableOpacity>

        <TouchableOpacity onPress={()=>{
          if(Platform.OS == "android"){
            NativeModules.HelloWorldModule.ShowMessage("This is first time we are creating bridge. :)", 5000);
          }
          else if(Platform.OS == "ios"){
            NativeModules.CallApi.callApi();
          }
        }}>
          <Text>Clíck aquí para llamar el método de la api!</Text>
        </TouchableOpacity>
      </View>
    )
  }
}