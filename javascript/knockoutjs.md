# Knockout JS

## What's that ?

Javascript library that simplifies interaction between the UI (HTML) and the data the user manipulates :
* UI updating whenever the data model changes
* Declarative binding

## What is the ModelViewViewModel Pattern

* Model : represents the business objects to manipulate
* ViewModel : represents the data and operations on a UI
* View : represents the UI, mostly HTML, binded to the ViewModel.


## Static text

### External resources

* [knockout.js](http://knockoutjs.com/downloads/knockout-2.2.1.js)

```javascript
function RockerViewModel() {
    this.prenom = "Jeff";
    this.nom = "Beck";
}

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

## create a form with knockout

```html
<body>
    <p>Prénom : <input data-bind="value: prenom"/></p>
    <p>Nom: <input data-bind="value: nom"/></p>
    
    <p>
        <strong data-bind="text: prenom"></strong>
        <strong data-bind="text: nom"></strong>
        rocks!
    </p>
</body>
```

```javascript
function RockerViewModel() {
    this.prenom = ko.observable("Jeff");
    this.nom = ko.observable("Beck");
}

ko.applyBindings(new RockerViewModel());
```

## Manage a list of item

### External Resources
* [bootstrap.js](http://twitter.github.io/bootstrap/assets/js/bootstrap.js)
* [bootstrap.css](http://twitter.github.io/bootstrap/assets/css/bootstrap.css)


```html
<h2>Votre panier</h2>

<table class="table table-hover">
    <thead>
        <tr>
            <th>Article</th><th>Prix unitaire</th><th>Quantité</th><th>Montant</th>
        </tr>
    </thead>
    <tbody data-bind="foreach: articles">
        <tr>
            <td data-bind="text: libelle"></td>
            <td data-bind="text: prixUnitaire"></td>
            <td data-bind="text: quantite"></td>
            <td data-bind="text: montant"></td>
        </tr>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="3"><strong>Total en EUR:</strong></td>
            <td data-bind="text: total"></td>
        </tr>
    </tfoot>
</table>
```

```javascript
function Article (libelle, quantite, prixUnitaire) {
    var self = this;
    self.libelle = libelle;
    self.prixUnitaire = prixUnitaire;    
    self.quantite = ko.observable(quantite);
    
    self.montant = ko.computed(function() {
        return self.prixUnitaire * self.quantite();
    });
}

function PanierViewModel() {
    var self = this;
    
    self.articles = ko.observableArray([
        new Article('Leffe', 6, 1.5),
        new Article('Chips', 1, 0.8),
        new Article('Limonade', 2, 1.5)
    ]);

    self.total = ko.computed(function() {
       var total = 0;
       for (var i = 0; i < self.articles().length; i++)
           total += self.articles()[i].montant();
       return total;
    });
    
}

ko.applyBindings(new PanierViewModel());
```

### Interactions with table

```html
<h2>Votre panier</h2>

<table class="table table-hover">
    <thead>
        <tr>
            <th>Article</th><th>Prix unitaire</th><th>Quantité</th><th>Montant en EUR</th><th></th>
        </tr>
    </thead>
    <tbody data-bind="foreach: lignesArticles">
        <tr>
            <td><select data-bind="options: $root.articlesDisponibles, value: article, optionsText: 'libelle'"></select></td>
            <td data-bind="text: prixUnitaire"></td>
            <td><input data-bind="value: quantite"/></td>
            <td data-bind="text: montant"></td>
            <td><a href="#" data-bind="click: $root.supprimerLigneArticle"><li class="icon-remove"></li></a></td>
        </tr>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="3"><strong>Total en EUR:</strong></td>
            <td data-bind="text: total"></td>
        </tr>
    </tfoot>
</table>

<button data-bind="click: ajouterLigneArticle">Ajouter un nouvel article</button>
```

```javascript
function LigneArticle (article, quantite) {
    var self = this;
    self.article = ko.observable(article);
    self.quantite = ko.observable(quantite);
    
    self.prixUnitaire = ko.computed(function() {
        return self.article().prix;
    });  
    
    self.montant = ko.computed(function() {
        return self.article().prix * self.quantite();
    });
}

function PanierViewModel() {
    var self = this;
    
    self.articlesDisponibles = [ 
        { libelle: "Leffe", prix: 1.5 },
        { libelle: "Chips", prix: 0.8},
        { libelle: "Limonade", prix: 1.5}
    ];
    
    self.lignesArticles = ko.observableArray([]);
    
    self.total = ko.computed(function() {
       var total = 0;
        for (var i = 0; i < self.lignesArticles().length; i++) {
            total += self.lignesArticles()[i].montant();
        }
       return total;
    });
    
    self.ajouterLigneArticle = function() {
        self.lignesArticles.push(new LigneArticle(self.articlesDisponibles[0], 1));
    }
    
    self.supprimerLigneArticle = function(ligneArticle) {
        self.lignesArticles.remove(ligneArticle);
    }
}

ko.applyBindings(new PanierViewModel());
```

## Source

[jsfiddle](http://jsfiddle.net/fut49/)


