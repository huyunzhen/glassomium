=begin
   Glassomium - web-based TUIO-enabled window manager
   http://www.glassomium.org

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
=end

module Servlets
  require 'webrick'
  require './ThemeManager'
  require './Servlets/BaseServlet'

  class ThemeConfig < BaseServlet
   
    def initialize(server)
      super(server)     

      @theme_cfg = ThemeManager.readConfiguration
    end

    def get_body(request, response)
      result = ""
      result += "THEME_CONFIG_BEGIN\n"
      @theme_cfg.each do |nskey, value|
        parts = nskey.split('.')
        (namespace, key) = parts[0], parts[1..parts.length].join('.')
        result += "#{namespace} #{key} #{value}\n"
      end
      result += "THEME_CONFIG_END\n"

      result
    end

  end
end
