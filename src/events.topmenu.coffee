# Eventful code comes here
# Program state should not be manipulated outside events files

topmenuImportBimserver = (event) ->
  bimserverImportDialogShow()

topmenuImportSceneJS = (event) ->
  fileImportDialogShow()

topmenuImportSample = (event) ->
  switch event.target.id
    when 'top-menu-import-sample-1'
      sampleUrl = "http://bimserver.github.com/bimsurfer-demo/static/models/Vogel-Gesamt.json"
    when 'top-menu-import-sample-2'
      sampleUrl = "http://bimserver.github.com/bimsurfer-demo/static/models/AC11-FZK-Haus.json"
    else
      return

  ($.get sampleUrl, undefined, undefined, 'json')
    .done (data, textStatus, jqXHR) -> 
      try
        loadScene data
      catch error
        console?.log? error
    .fail (jqXHR, textStatus, errorThrown) -> 
      console?.log? textStatus
      return # TODO

topmenuPerformanceQuality = (event) ->
  ($ event.target).addClass 'top-menu-activated'
  ($ '#top-menu-performance-performance').removeClass 'top-menu-activated'
  ($ '#viewport').removeClass 'viewport-performance'
  state.settings.performance = 'quality'
  windowResize()

topmenuPerformancePerformance = (event) ->
  ($ event.target).addClass 'top-menu-activated'
  ($ '#top-menu-performance-quality').removeClass 'top-menu-activated'
  ($ '#viewport').addClass 'viewport-performance'
  state.settings.performance = 'performance'
  windowResize()

topmenuModeBasic = (event) ->
  ($ event.target).addClass 'top-menu-activated'
  ($ '#top-menu-mode-advanced').removeClass 'top-menu-activated'
  state.settings.mode = 'basic'

topmenuModeAdvanced = (event) ->
  ($ event.target).addClass 'top-menu-activated'
  ($ '#top-menu-mode-basic').removeClass 'top-menu-activated'
  state.settings.mode = 'performance'

topmenuHelp = () ->
  ($ '#top-menu-help').toggleClass 'top-menu-activated'
  ($ '#main-view-help').toggle()
  ($ '#main-view-keys').toggle()
