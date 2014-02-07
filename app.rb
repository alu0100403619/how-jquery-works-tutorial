require 'sinatra'

# Los ficheros estaticos estaran en esta ruta
set :public_folder, File.dirname(__FILE__) + '/starterkit'

#si se visita la pagina raiz devuelve index
get '/' do
  erb :index
end

#Si visitas una pagina chuchu
get '/chuchu' do
  if request.xhr? #si es un request ajax
    "hello world!" #devuelve hellow world
  else #si no es un request ajax devuelve la pagina tutu
    erb :tutu
  end
end

#Fin de fichero
__END__

@@layout
  <!DOCTYPE html>
  <html>
    <head>
        <meta charset="utf-8" />
        <title>Demo</title>
    </head>
    <body>
        <a href="http://jquery.com/">jQuery</a>
        <div class="result"></div>
        <script src="jquery.js"></script>
        <%= yield %>
    </body>
  </html>

@@index
  <script>
  $( document ).ready(function() {
      $( "a" ).click(function( event ) {
          event.preventDefault();
          $.get( "/chuchu", function( data ) {
            $( ".result" ).html( data );
            alert( "Load was performed." );
          });
      });
  });
  </script>

@@tutu
  <h1>Not an Ajax Request!</h1>
