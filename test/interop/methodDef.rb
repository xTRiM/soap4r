# Method definition.
def methodDef( drv )
  drv.addMethod( 'echoVoid' )
  drv.addMethod( 'echoString', 'inputString' )
  drv.addMethod( 'echoStringArray', 'inputStringArray' )
  drv.addMethod( 'echoInteger', 'inputInteger' )
  drv.addMethod( 'echoIntegerArray', 'inputIntegerArray' )
  drv.addMethod( 'echoFloat', 'inputFloat' )
  drv.addMethod( 'echoFloatArray', 'inputFloatArray' )
  drv.addMethod( 'echoStruct', 'inputStruct' )
  drv.addMethod( 'echoStructArray', 'inputStructArray' )
end

def methodDefWithSOAPAction( drv, soapAction )
  drv.addMethodWithSOAPAction( 'echoVoid', soapAction + 'echoVoid' )
  drv.addMethodWithSOAPAction( 'echoString', soapAction + 'echoString', 'inputString' )
  drv.addMethodWithSOAPAction( 'echoStringArray', soapAction + 'echoStringArray', 'inputStringArray' )
  drv.addMethodWithSOAPAction( 'echoInteger', soapAction + 'echoInteger', 'inputInteger' )
  drv.addMethodWithSOAPAction( 'echoIntegerArray', soapAction + 'echoIntegerArray', 'inputIntegerArray' )
  drv.addMethodWithSOAPAction( 'echoFloat', soapAction + 'echoFloat', 'inputFloat' )
  drv.addMethodWithSOAPAction( 'echoFloatArray', soapAction + 'echoFloatArray', 'inputFloatArray' )
  drv.addMethodWithSOAPAction( 'echoStruct', soapAction + 'echoStruct', 'inputStruct' )
  drv.addMethodWithSOAPAction( 'echoStructArray', soapAction + 'echoStructArray', 'inputStructArray' )
end