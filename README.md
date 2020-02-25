
# Retro Asphalt (exercice)

https://retro-asphalt.herokuapp.com/

Marketplace afin de tester et mettre en place plusieurs fonctionnalités « back-end » et d’approfondir ma connaissance sur le Framework Rails.
Le Design, l’UI et l’UX n’étant pas le but premier de cette app ( jusque là :-) ) . L’app est « volontairement »  moche , cherchant simplement à satisfaire des besoins de navigation entre les différentes routes.

## Features

#### User:

```
  Chaque User a la possibilité de rajouter, louer, éditer ses voitures.
  Ils ont accès a un Dashboard, afin de pouvoir voir les locations qu'ils font,
  ainsi que les locations de leur propres voitures.
 ```

#### Paiement:

 ```
 Une location d'une voiture est possible, selon les disponibilités de cette dernière.
 Le paiement se fait à travers Stripe, qui met à jour le statut de la réservation. Une fois,
 le paiment effectué
 ```

#### Mailing:

```
Lors de la création d'une voiture, l'utilisateur reçoit un mail ( environnement dev uniquement).
Lui confirmant la création
```

#### Map:

```
Toutes les voitures sont géocodées
```


## Aspects Techniques:


#### Helpers :

```
Création d'un instance_image_tag / instance_image_path Helper afin de vérifier la présence d'une image
Cloudinary, si non , envoi d'une image par défaut.
```

#### Validations :

```
Le modèle booking, dispose d'une méthode de vérification que la durée de location est positive.
Un "validator" de disponibilité de la voiture a été crée également, afin de ne pas avoir plusieurs
locations sur une même journée.
```

#### AJAX (rails 5.2):

```
Dans le Dashboard, création d'une voiture en Ajax (route non nestées).
```

#### Forms with JS

```
Flatpicker utilisé pour le formulaire de booking, avec les dates non disponibles grisées.
```

#### Tests:

```
Test unitaires de User / Car écrit, ainsi qu'un test de navigation
```

#### Autorisation

```
Toutes les actions sont white-listées à travers Pundit, un user ne pouvant accèder à d'autres bookings /cars.
La show d'une car ne contient pas de lien vers le booking quand c'est la voiture de l'utilisateur.
```

#### Api de paiement:

```
Création d'une session Stripe de paiement, avec Websocket pour la mise à jour du statut du règlement.
L'app envoi la photo par défaut quand il n'y a pas d'image Cloudinary.
```
