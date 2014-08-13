
# KDListItemView

KDListItemView is primarily a default class, used by 
[KDListView](./kdlistview.md) and 
[KDListViewController](./kdlistviewcontroller.md) as the default view to be 
added.

It comes with a method that provides the default partial, meaning that if you 
choose to inherit from this class you should implement your own `partial` 
method returning a string you'd like to use.

## Usage

```coffee
class CustomListItem extends KDListItemView
  partial: -> 'This is my custom list item'

view = new KDListView()
view.addItemView new CustomListItem()

appView.addSubView header
```

As you can see, we implemented a class `CustomListView` that extended the 
`partial` method and returned a string that we wanted to use.

## API Index

> class KDListItemView extends [KDView][kdview]
> - [dim](#dim): ->
> - [undim](#undim): ->
> - [highlight](#highlight): ->
> - [removeHighlight](#removeHighlight): ->

KDListItemView extends [KDView](./kdview.md). Please see that for inherited 
methods.

### [Constructor]()
> [constructor](#constructor): (options={}, data) ->

- **options**:
  - Type: object
  - Default: `{}`

  The following keys are supported.

  - **options.childClass**: The that all subview will be changed to
    - Type: object
    - Default: `null`
  - **options.childOptions**: Options passed to all subviews
    - Type: object
    - Default: `{}`
  - **options.selectable**: Whether this object can be selected or not
    - Type: boolean
    - Default: `true`
    
###[dim]()
> [dim](#dim): ->

Dims the view by setting the CSS class `"dimmed"`

###[undim]()
> [undim](#undim): ->

Undims the view by unseting the CSS class `"dimmed"`

###[highlight]()
> [highlight](#highlight): ->

Highlights the view by setting the CSS `"selected"`. If the view was dimmed it will be undimmed

###[removeHighlight]()
> [removeHighlight](#removeHighlight): ->

Removes the highlight of the view by unsetting the CSS class `"selected"`. If the view was dimmed it will be undimmed