
# MarvelApp

Este proyecto consiste en mostrar la lista de todos los personajes de Marvel y mostrar un pequeño detalle de cada uno de ellos. 
En el detalle se muestra una lista de las historias donde aparece el personaje seleccionado.
En caso de que no se pueda cargar la lista de personajes o el detalle del personaje seleccionado, saltará un aviso de error.
Está desarrollado con arquitectura VIP, ya que es la más simple y modular para este tipo de aplicación.
Se utiliza Alamofire para las conexiones con la API. 

## Comenzando 🚀

Estas instrucciones te permitirán obtener una copia del proyecto en funcionamiento en tu máquina local para propósitos de desarrollo y pruebas.

### Estructura del proyecto 🖇️
La estructura del proyecto es la siguiente:
```
\- Assets
    \-  Assets.xcassets: que contiene las imágenes del proyecto.
    
\- Interface
   \-  LaunchScreen.storyboard
   \-  Main.storyboard 
   \-  Characteres.storyboard 
   
\- Source
    \- Commons
        \- Utils 
            Loading.swift
            TextColor.swift
            
        \- Animations 
            AnimationButton.swift
            
        \- Models 
            ListCharactersModel.swift
            ImageCharacter.swift
            DataCharacterResponse.swift
            DataCharacter.swift
            ListCharacter.swift
            UrlCharacter.swift
            ItemList.swift
            ItemSummary.swift
            StoryList.swift
            StorySummary.swift
            
        Constants.swift
        
    \- Repositories (llamada a los servicios)
        Services.swift
    
    \- Scenes
        \- DetailCharacters (muestra el detalle)
            \- DetailView (archivo necesario para mostrar la vista de las celdas)
            DetailCharactersPresenter.swift
            DetailCharactersInteractor.swift
            DetailCharactersRouter.swift
            DetailCharacterViewController.swift
            
        \- ListCharacters (muestra los personajes)
            \- CustomViewCell (archivo necesario para mostrar la vista de las celdas)
            ListCharactersPresenter.swift
            ListCharactersInteractor.swift
            ListCharactersRouter.swift
            ListCharactersViewController.swift
            
        \- Login (muestra pantalla de inicio)
            LoginPresenter.swift
            LoginInteractor.swift
            LoginRouter.swift
            LoginViewController.swift

    \- Delegates 
        AppDelegate.swift
        SceneDelegate.swift
\- MarvelAppUITest 
\- MarvelAppTest

    ^- Pruebas automatizadas
```

### Pre-requisitos   📋

Para poder visualizar y probar este proyecto es necesario que tengas instalado:
- [Xcode](https://developer.apple.com/xcode/downloads/) (Version 11.3.1)
- Instala [CocoaPods](https://guides.cocoapods.org/using/using-cocoapods.html) como administrador de dependencias.

### Instalación  🔧

1.  Clona este repositorio, abriendo una terminal, cambiando el directorio de trabajo actual a la ubicación donde deseas que se clone el directorio y escribiendo lo siguiente:
    ```
    $ git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY
    ```
    
     Presiona  **Enter**  (Intro) y espera a que finalice el proceso.


2.   Use CocoaPods 
    
    ```
     pod 'Alamofire'
    ```
    

3. Vaya al proyecto desde  **Terminal**  y ejecute:

```
    pod install
```

4.  Abra  **MarvelApp.xcworkspace**


### NOTAS:

1. Si no sabes clonar un proyecto mira este enlace: [https://help.github.com/es/github/creating-cloning-and-archiving-repositories/cloning-a-repository](https://help.github.com/es/github/creating-cloning-and-archiving-repositories/cloning-a-repository)

2. Para obtener más información, consulta  **Usar CocoaPods**  en  [Recursos adicionales](https://github.com/microsoftgraph/ios-swift-connect-sample/blob/master/README-Localized/README-es-es.md#AdditionalResources)

3. Si no te funciona correctamente Alamofire, comprueba que en tu Podfile del proyecto tienes añadido lo siguiente

```
 pod 'Alamofire'
 pod 'SwiftyJSON'
 ```
    

4. Se incluyen los archivos de test pero están comentados porque por un problema con XCode salta una ventana de error.  Se solventará más adelante.

## Autor  ✒️

Este proyecto esta realizado por 

-   **Marta Murillo Bermejo** 

## Versiones  📌

Version 1.0
