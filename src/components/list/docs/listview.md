
# KDListView

KDListView is a View that implements a List. By default, this List is not a 
`<ul>` or `<ol>`, but rather a series of nested `<divs>`. KDListView takes care 
of the ordering and arrangement.

## Usage

Like any other view, we create the instance and add it to another view. In this 
case, `appView`. The key here is that after adding our ListView, we have to add 
items to our list. We do this with the [addItemView](#additemview) method. Lets 
see what that looks like.

```coffee
view = new KDListView()

view.addItemView new KDView partial: 'Item 1'
view.addItemView (new KDView partial: 'Item 0'), 0

appView.addSubView header
```

Pretty simple eh? We just called the `addItemView` method and gave it an 
instance of a [KDView][kdview].

Additionally, to demonstrate the index adding, we added the `"Item 0"` view 
second, with an index of `0`.

## API Index

> class KDListView extends [KDView][kdview]
> - [constructor](#constructor): (options={}, data) ->
> - [empty](#empty): ->
> - [keyDown](#keyDown):(event) ->
> - [addItem](#addItem): (itemData,index) ->
> - [removeItem](#removeItem): (itemInstance,itemData,index) ->
> - [removeItemByData](#removeItemByData): (itemData) ->
> - [removeItemByIndex](#removeItemByIndex): (index) ->
> - [destroy](#destroy): ->
> - [addItemView](#addItemView): (itemInstance,index) ->
> - [appendItem](#appendItem): (itemInstance) ->
> - [insertItemAtIndex](#insertItemAtIndex): (itemInstance,index) ->
> - [getItemIndex](#getItemIndex): (itemInstance) ->
> - [moveItemToIndex](#moveItemToIndex): (item,newIndex) ->
> - [doIHaveToScroll](#doIHaveToScroll): ->
> - [isScrollAtBottom](#isScrollAtBottom): ->


## [Class](https://github.com/koding/kd/blob/master/src/components/list/listview.coffee#L3)

KDListView extends [KDView][kdview]. Please see that for inherited methods.

### [Constructor]()
> [constructor](#constructor): (options={}, data) ->

- **options**:
  - Type: object
  - Default: `{}`

  The following keys are supported.

  - **options.type**: The type of list.
    - Type: string
    - Default: `"default"`
  - **options.lastToFist**: Whether to append elements when added or prepend them
    - Type: boolean
    - Default: `false`
  - **options.itemOptions**: Options to be transfered to child views in the list
    - Type: object
    - Default: `{}`
  - **options.itemChildClass**: The class which the created child views will be when using [addItem](#addItem) (Must subclass KDView)
    - Type: object
    - Default: `KDListItemView`
  - **options.autoScroll**: Whether the list should automatically scroll if overflow is present
    - Type: boolean
    - Default: `undefined`
  - **options.boxed**: Whether the list should use boxes for grouping elements
    - Type: boolean
    - Default: `false`
  - **options.itemsPerBox**: Amount of items put in each box
    - Type: number
    - Default: `10`
    
### [empty]()
> [empty](#empty): ->

Clears the list of all its content

### [keyDown]()
> [keyDown](#keyDown): (event) ->

Function that is called whenever a key is pressed

#### Args

1. **event**: The event object 
  - Type: object

###[addItem]()
>[addItem](#addItem): (itemData,index) ->

Creates and adds a view based on the itemData passed with the default itemOptions specified. Emits `"ItemWasAdded"` with the created view and the index as parameters

#### Args

1. **itemData**: Data passed as the `data` parameter to the constructor of the view
  - Type: object
  - Default: `undefined`
  
2. **index**: The index at which the item object should be added. Note that for backwards compatibilty if the parameter is not set to a number it will be used as optinos for the item.
  - Type: number
  - Default: `undefined`

#### Returns
An instance of the view

###[removeItem]()
>[removeItem](#removeItem): (itemInstance,itemData,index) ->

First attempts to remove a view by its index. If the index is not found, will attempt to remove the view by its instance and itemData in that order. Emits `"ItemWasRemoved"`

#### Args

1. **itemInstance**: The instace of the view you are trying to remove from the list
  - Type: object
  - Default: `undefined`
  
2. **itemData**: The item data by which you are attempting to remove from the list
  - Type: object
  - Default: `undefined`
  
3. **index**: The index by which you are attempting to remove fromt the list
  - Type: number
  - Default: `undefined`

#### Returns
The removed item. `null` if nothing was removed

### [removeItemByData]()
> [removeItemByData](#removeItemByData): (itemData) ->

Attempts to remove a view by its `itemData`. Emits `"ItemWasRemoved"`

#### Args

1. **itemData**: The item data by which you are attempting to remove from the list
  - Type: object
  - Default: `undefined`

#### Returns
The removed item. `null` if nothing was removed

### [removeItemByIndex]()
> [removeItemByIndex](#removeItemByIndex): (index) ->

Attempts to remove a view by its index. Emits `"ItemWasRemoved"`

#### Args

1. **index**: The index by which you are attempting to remove fromt the list
  - Type: number
  - Default: `undefined`

#### Returns
The removed item. `null` if nothing was removed
 
### [destroy]()
> [destroy](#destroy): ->

Destroys the view and all its children

###[addItemView]()
> [addItemView](#addItemView): (itemInstance,index) ->

Adds an already created view to the list. The default options will not be passed and the class will not be set. Emits `"ItemWasAdded"` with the created view and the index as parameters

#### Args

1. **itemInstance**: The instance of the view that you would like to add
  - Type: object
  - Default: `undefined`
  
2. **index**: The index at which the item object should be added.
  - Type: number
  - Default: `undefined`
  
###[appendItem]()
> [appendItem](#appendItem): (itemInstance) ->

Appends item to the end of the list

#### Args

1. **itemInstance**: The instance of the view that you would like to append
  - Type: object
  - Default: `undefined`

#### Returns
The added item

###[insertItemAtIndex]()
> [insertItemAtIndex](#insertItemAtIndex): (itemInstance,index) ->

Insert an already created view at a certain index the list. The default options will not be passed and the class will not be set. Emits `"ItemWasAdded"` with the created view and the index as parameters

#### Args

1. **itemInstance**: The instance of the view that you would like to insert
  - Type: object
  - Default: `undefined`
  
2. **index**: The index at which the item object should be inserted
  - Type: number
  - Default: `undefined`

#### Returns
The added item

###[packageItem]()
> [packageItem](#packageItem): (itemInstance) ->

Packages an item into a suitable box. Will not work if `boxed` is set to `false`

#### Args

1. **itemInstance**: The instance of the view that you would like to package
  - Type: object
  - Default: `undefined`
  
###[createBox]()
> [createBox](#createBox): ->

Creates and returns a new box

#### Returns
A newly created box

###[getItemIndex]()
> [getItemIndex](#getItemIndex): (itemInstance) ->

Returns the index of the itemInstance specified. Returns -1 if the item is not in the list

#### Args

1. **itemInstance**: The instance of the item that you would like to get the index of
  - Type: object
  - Default: `undefined`
  
####Returns
The index of the item

###[moveItemToIndex]()
> [moveItemToIndex](#moveItemToIndex): (item,newIndex) ->

Move an item from one index in the list to another

#### Args

1. **item**: The instance of the view that you would like to move
  - Type: object
  - Default: `undefined`
  
2. **newIndex**: The index to which you would like to move to
  - Type: number
  - Default: `undefined`

#### Returns
The added item

###[doIHaveToScroll]()
>[doIHaveToScroll](#doIHaveToScroll): ->

#### Returns
Returns a boolean of whether the scrollView containing this list has to scroll to reveal more content. Will always return `false` if autoScroll is set to `false`

###[isScrollAtBottom]()
>[isScrollAtBottom](#isScrollAtBottom): ->

#### Returns
Returns a boolean of whether the scroll is at the bottom of the list

[kdview]: ./kdview.md
