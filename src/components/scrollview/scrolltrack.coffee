KDView = require './../../core/view'

module.exports = class KDScrollTrack extends KDView

  constructor:(options = {}, data)->

    options.type   or= 'vertical'
    options.cssClass = KD.utils.curry "kdscrolltrack #{options.type}", options.cssClass

    super options, data

    {@type} = @getOptions()

    @thumb = new KDScrollThumb
      cssClass : 'kdscrollthumb'
      type     : @type
      track    : this


  viewAppended: ->
    super()
    @addSubView @thumb


  show:->

    @getDelegate().emit "ScrollTrackShown", @type
    @unsetClass 'invisible'


  hide:->

    @getDelegate().emit "ScrollTrackHidden", @type
    @setClass 'invisible'

