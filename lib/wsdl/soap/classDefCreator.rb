=begin
WSDL4R - Creating class definition from WSDL
Copyright (C) 2002 NAKAMURA Hiroshi.

This program is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation; either version 2 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PRATICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program; if not, write to the Free Software Foundation, Inc., 675 Mass
Ave, Cambridge, MA 02139, USA.
=end


require 'wsdl/data'
require 'wsdl/xmlSchema/classDefCreator'


module WSDL
  module SOAP


class ClassDefCreator < WSDL::XMLSchema::ClassDefCreator
  attr_reader :definitions

  def initialize( definitions )
    @definitions = definitions
    super( definitions.types.schema )
    @faultTypes = getFaultTypes( @definitions )
  end

private

  # Overrides WSDL::XMLSchema::ClassDefCreator#dumpClassName
  def dumpClassName( className )
    if @faultTypes.index( className )
      "#{ className.name } < StandardError"
    else
      "#{ className.name }"
    end
  end

  def getFaultTypes( definitions )
    result = []
    getFaultMessages( definitions ).each do | message |
      parts = definitions.messages[ message ].parts
      if parts.size != 1
	raise RuntimeError.new( "Expects fault message to have 1 part." )
      end
      if result.index( parts[0].type ).nil?
	result << parts[0].type
      end
    end
    result
  end

  def getFaultMessages( definitions )
    result = []
    definitions.portTypes.each do | portType |
      portType.operations.each do | operation |
	if operation.fault && result.index( operation.fault.message ).nil?
	  result << operation.fault.message
	end
      end
    end
    result
  end
end


  end
end