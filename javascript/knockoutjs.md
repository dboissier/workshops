# Knockout JS

## What's that ?


## What is the MVVM Pattern


## Example with jQuery

```html
<body>
    <p>
        <strong id='prenom'></strong>
        <strong id='nom'></strong> 
        rocks !
    </p>
</body>
```

```javascript
$('#nom').text('Beck');
$('#prenom').text('Jeff');

```

## Example with knockout


```javascript
function RockerViewModel() {
    this.prenom = "Jeff";
    this.nom = "Beck";
}

// Activates knockout.js
ko.applyBindings(new RockerViewModel());
```

```html
<body>
    <p>
        <strong data-bind="text: prenom"></strong> 
        <strong data-bind="text: nom"></strong>
        rocks!
    </p>
</body>

```
