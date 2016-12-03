/*
 *    app by
 *      
 *      @pabloMontoya
 *
 */


var myApp = angular.module('AppAutored', ['ngResource','ui.router', 'ui.bootstrap'])


        myApp.factory("Product", function($resource) {
          return $resource("products/:cod_prod/", { cod_prod: '@cod_prod'}, {
            index:   { method: 'GET', isArray: true, responseType: 'json' }
          });
        })

        myApp.factory("Brand", function($resource){
            return $resource("brands/:marca", {marca: '@marca'}, {
            index:   { method: 'GET', isArray: true, responseType: 'json' }
          });
        })

        myApp.controller('MainCtrl', [
            '$scope',
            '$http',
            'Product',
            'Brand',
            function($scope, $http, Product, Brand) {

                //Método para ordenar un arreglo
                function sortArray(arr) {
                    var tmp = [];
                    for (var i = 0; i < arr.length; i++) {
                        if (tmp.indexOf(arr[i]) == -1) {
                            tmp.push(arr[i]);
                        }
                    }
                    return tmp;
                }


                
                //Selecciona muchos productos mediante marca, modelo y año del auto usando ajax $http.get request
                $scope.getProducts = function() {
                    var http;
                    var productos = [];
                    var model_codigo = $scope.model_codigo;
                    http = {
                        method: "GET",
                        url: "http://localhost:3000/products/cod_prod/", 
                        params: {
                            cod_prod: $scope.model_codigo, marca_equipos: $scope.model_marca, modelo_equipos: $scope.model_modelo, año_equipos: $scope.model_anhio
                        }
                    };

                    // Se inyecta todas las productos en el arreglo para la vista ($scope.productos)
                    return $http(http).success(function(response) {
                        console.log(response);
                        $scope.product = response;

                        response.forEach(function(producto){
                                if (!productos[producto]) {
                                    productos.push(producto)
                                }
                            })
                            
                            $scope.productos = sortArray(productos).sort();
                            console.log($scope.productos);
                    });
                };

                //Selecciona un producto mediante el código del producto usando ajax $http.get request
                $scope.getProductsByCode = function() {
                    var http;
                    var productos = [];
                    http = {
                        method: "GET",
                        url: "http://localhost:3000/bycodes/", 
                        params: {
                            cod_prod: $scope.model_codigo
                        }
                    };

                    // Se inyecta todas las productos en el arreglo para la vista ($scope.productos)
                    return $http(http).success(function(response) {
                        console.log(response);
                        $scope.product = response;

                        response.forEach(function(producto){
                                if (!productos[producto]) {
                                    productos.push(producto)
                                }
                            })
                            
                            $scope.productos = sortArray(productos).sort();
                            console.log($scope.productos);
                    });
                };

                //inyecta todas las marcas en el arreglo para la vista ($scope.marcas)
                $scope.brands = Brand.index(function(){ 
                    $scope.marcas = [];

                    $scope.brands.forEach(function(brands) {
                        $scope.marcas.push(brands.marca)
                    })
                    $scope.marcas = sortArray($scope.marcas).sort();
                });


                  //selecciona todos los modelos de una marca mediante ajax $http.get request
                  $scope.getModels = function() {
                        var http;
                        var modelos = []
                        http = {
                            method: "GET",
                            url: "http://localhost:3000/models/",
                            params: {
                                marca_equipos: $scope.model_marca
                            }
                        };

                        //Se inyectan todos los modelos que vienen en el arreglo de objetos al arreglo para la vista ($scope.modelos)
                        return $http(http).success(function(response) {
                            //console.log(response);

                            response.forEach(function(modelo){
                                if (!modelos[modelo.modelo]) {
                                    modelos.push(modelo.modelo)
                                }
                            })
                            $scope.modelos = sortArray(modelos).sort();
                            //console.log(modelos);
                        });
                    };                        

                //selecciona todos los años de un modelo mediante ajax $http.get request
                $scope.getYears = function(){
                    var http;
                    var anhios = []
                    http = {
                        method: "GET",
                        url: "http://localhost:3000/years/",
                        params: {
                            modelo_equipos: $scope.model_modelo
                        }
                    };

                    //Se inyectan todos los años que vienen en el arreglo de objetos al arreglo para la vista ($scope.anhios)
                    return $http(http).success(function(response) {
                        //console.log(response);

                        response.forEach(function(anhio){
                            if (!anhios[anhio.anhio]) {
                                anhios.push(anhio.anhio)
                            }
                        })
                        //ordenar de mayor a menor
                        $scope.anhios = sortArray(anhios).sort(function(a, b){return b-a});
                    });
                };

                $scope.checkstring = function(str){
                    if ($.trim(str) == "MATRIZ") {
                        return 1
                    }else if ($.trim(str) == "VICTORIA") {
                        return 2
                    }else if ($.trim(str) == "BARRANCOS") {
                        return 3
                    }else if ($.trim(str) == "LOMA LINDA") {
                        return 4
                    }else if ($.trim(str) == "LOMBARDO TOLEDANO") {
                        return 5
                    }else if ($.trim(str) == "SANALONA") {
                        return 6
                    }else if ($.trim(str) == "CALZADA") {
                        return 7
                    }else if ($.trim(str) == "NAVOLATO") {
                        return 8
                    }else if ($.trim(str) == "TELEMARKETING") {
                        return 9
                    }else if ($.trim(str) == "DIRECTOS (CHECAR TIENDAS)") {
                        return 10
                    }
                }

                //Método para limpiar los combobox
                $scope.clear = function(){
                    $scope.modelos = [];
                    $scope.anhios = [];
                };

                $scope.toggle_element = function(element,speed){
                    $element.toggle(speed);
                }

            }
        ]);