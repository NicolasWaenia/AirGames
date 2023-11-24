# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
# ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
# MovieGenre.find_or_create_by!(name: genre_name)
# end

require "open-uri"

puts "Creating accounts......"
Review.destroy_all
Game.destroy_all
User.destroy_all

photo_marion =
URI.open("https://avatars.githubusercontent.com/u/137996776?v=4")

photo_jf =
URI.open("https://avatars.githubusercontent.com/u/109537083?v=4")

photo_nicolas =
URI.open("https://avatars.githubusercontent.com/u/147147521?v=4")

marion = User.create!(first_name: "Marion", last_name: "Guédon", address: "Rue Saint Sébastien, Lille", city: "Lille", email:
"marion@lewagon.org", password: "password")
jennifer = User.create!(first_name: "Jennifer", last_name: "Crétal", address: "Rue des gantois, La Madeleine", city:
"Marquette-Lez-Lille", email: "jennifer@lewagon.org", password: "password")
nicolas = User.create!(first_name: "Nicolas", last_name: "Cureau", address: "Résidense denise vernay, Lievin", city: "Liévin",
email: "nicolas@lewagon.org", password: "password")
acheteur = User.create!(first_name: "User", last_name: "User", address: "Rue de Gand, Lille", city: "Lille",
email: "user@lewagon.org", password: "password")


marion.profile_picture.attach(io: photo_marion, filename: "marion.jpg", content_type: "image/jpg")
jennifer.profile_picture.attach(io: photo_jf, filename: "jf.jpg", content_type: "image/jpg")
nicolas.profile_picture.attach(io: photo_nicolas, filename: "nicolas.jpg", content_type: "image/jpg")


puts "Accounts created !"
puts "------------------"
puts "------------------"
puts "------------------"
puts "Creating games......."
photo_catan =
URI.open("https://i5.walmartimages.com/asr/dae73acf-c536-4c87-a36a-ec2db4c007c6.e5e9aee160f32a439052aa8aef49b6df.jpeg")
photo_vilainous =
URI.open("https://www.espritjeu.com/upload/image/villainous-p-image-68618-grande.jpg")
photo_uno =
URI.open("https://i.ebayimg.com/images/g/02EAAOSwHuZk8mz1/s-l1600.jpg")
photo_dixit =
URI.open("https://cdn2.philibertnet.com/509639-thickbox_default/dixit.jpg")
photo_citadelles =
URI.open("https://m.media-amazon.com/images/I/81Zy4cwNePL._AC_SL1500_.jpg")
photo_smallworld =
URI.open("https://cdn2.philibertnet.com/568880-thickbox_default/small-world.jpg")
photo_cluedo =
URI.open("https://m.media-amazon.com/images/I/61YAfsdVdZL._AC_SL1000_.jpg")
photo_mysterium =
URI.open("https://www.espritjeu.com/upload/image/mysterium-p-image-56161-grande.jpg")
photo_unlock =
URI.open("https://m.media-amazon.com/images/I/81Bwyy6v6PL._AC_SL1500_.jpg")

catan_game = Game.new(name: 'Catan',
number_of_players_min: 2,
number_of_players_max: 6,
category: 'Science Fiction',
price: 1.99,
user: marion,
description: "Construisez vos villes, vos routes, en profitant au mieux des ressources de cette île si accueillante tout
en commerçant avec vos voisins. Catan est un jeu passionnant, véritable succès parmi les jeux de société contemporains.
Sorti en 1995 sous le nom 'Les Colons de Catane', ce jeu de société reste l'un des plus vendus dans le monde et a
insufflé un véritable renouveau dans le monde des jeux de stratégie et de plateau. Les règles sont simples, les parties
sont d'une durée raisonnable et le mécanisme est très fluide, alliant gestion de ressources et négociations entre
joueurs. L'objectif : vous devez être le premier à atteindre 10 points de victoire. Les points de victoire sont acquis
en construisant des routes et villages. Catan est basé sur plusieurs mécanismes simples. Le plateau représente l'île de
Catane et ses différents paysages vous apportant différents types de ressources. Selon la position sur le plateau de vos
routes et villages, vous collecterez à chaque tour des ressources que vous gérerez afin de construire routes et villages
(qui doivent toujours être reliés). Vous pourrez échanger des ressources avec vos adversaires, négocier mais aussi gêner
leur développement en plaçant judicieusement vos propres constructions. Plus vous vous développerez, plus vous aurez des
chances de collecter des ressources supplémentaires pour construire et ainsi voler vers la victoire. Catan, malgré sa
simplicité, a une dimension tactique et stratégique très sympathique. Des extensions complémentaires au jeu de base vous
permettent, en apportant de nouvelles possibilités, de renouveler le jeu et de le rendre encore plus passionnant.")
catan_game.photo.attach(io: photo_catan, filename: "catan.jpg", content_type: "image/jpg")
catan_game.save



vilainous_game = Game.create!( name: 'Vilainous',
number_of_players_min: 2,
number_of_players_max: 4,
category: 'Science Fiction',
price: 2.30,
user: jennifer,
description: "Quel méchant sommeille en vous ?

Dans le jeu Villainous, vous entrez dans la peau de 6 célèbres Méchants de Disney : Maléfique, Jafar, Capitaine Crochet, Ursula, Prince Jean et la Reine de cœur ; et suivez votre propre objectif diabolique pour gagner le titre de pire méchant de tous les temps ! Pour y parvenir, utilisez astucieusement vos capacités spéciales et tentez de ruinez les plans de vos adversaires. Car ce n’est qu’en dictant avec succès vos règles aux héros de Disney que vous pourrez espérer une fin… malheureuse !

Tout comme dans les films, aucun Méchant ne se ressemble : chaque univers est fidèlement transposé grâce à des cartes propres à chaque Méchant et un objectif personnel. L’immersion est totale, que vous essayez de maudire le royaume en tant que Maléfique ou de devenir le plus riche avec le Prince Jean, chaque partie sera différente que ce soit au niveau de votre stratégie, des pouvoirs de vos cartes ou du but à atteindre. Mais que serait un Méchant sans sa némésis ?

Chaque Méchant a un deck de cartes Fatalité que les autres joueurs utiliseront contre lui : des héros de Disney comme Ariel, Peter Pan, Aladdin ou encore Robin des bois viendront alors perturber vos plans, utilisant des objets, comme la poudre de fée, la lampe merveilleuse, et toutes sortes de ruses et d’effets. Réveillez le Mal qui est en vous… Suivez vos propres plans machiavéliques et devenez le plus grand méchant de Disney !

Villainous contient 6 magnifiques figurines inspirées par les Méchants du jeu ! Pour vous transportez de lieux mythiques en lieux mythiques et revivre les scènes iconiques des différents films.")
vilainous_game.photo.attach(io: photo_vilainous, filename: "vilainous.jpg", content_type: "image/jpg")
vilainous_game.save

uno_game = Game.new( name: 'Uno',
number_of_players_min: 2 ,
number_of_players_max: 8,
category: 'Card Game',
price: 1.85,
user: nicolas,
description: "Facile à apprendre, vous serez vite gagnés par la frénésie de UNO, le plus célèbre des jeux de cartes familiaux.

Pour gagner, débarrassez-vous de toutes vos cartes en jouant une carte de la même couleur, du même numéro ou une carte Action !

Utilisez les cartes Action pour piéger vos adversaires.Lorsqu'il ne vous reste qu'une seule carte en main, n'oubliez jamais de dire UNO !")
uno_game.photo.attach(io: photo_uno, filename: "uno.jpg", content_type: "image/jpg")
uno_game.save

dixit_game = Game.new( name: 'Dixit',
number_of_players_min: 2,
number_of_players_max: 8,
category: 'Science Fiction',
price: 2.50,
user: marion,
description: "En adaptant le jeu du dictionnaire, l'auteur de Dixit et l'illustratrice ont créé un jeu magique aussi plaisant en famille qu'entre amis. Votre imagination et celle de vos adversaires seront la base du jeu et vous vivrez un moment unique.

A partir des illustrations de Marie Cardouat, la magie de Dixit opère très vite. De ces quelques images on obtient, en ajoutant sa personnalité et son univers, la phrase qui lancera le jeu. Que vous évoque un lapin en armure qui se tient, épée levée, devant trois portes? La réponse sera différente pour chaque personne et c'est ce qui fait le charme de Dixit.

Le jeu Dixit fait appel à votre imagination, à votre interprétation et à votre univers personnel. Confrontez votre vision des cartes avec celles de vos amis, et découvrez vous les uns les autres. Dans ce jeu familial, rêve, imagination, poésie, et références culturelles aboutissent à un mélange d'exception.

Un des joueurs fait office de conteur. À partir d'une des cartes présentes dans sa main, il devra mettre au point une phrase en rapport avec l'image et la dire à haute voix.
Cette phrase peut-être de différentes formes, inventée de toutes pièces, ou empruntée à une oeuvre existante. La seule limite est l'imagination.

Ensuite les autres joueurs observent leurs propres cartes, en désignent une et la remètent au conteur. Ce dernier mélangera alors les cartes obtenues avec la carte qu'il a retenu auparavant. Puis il dévoilera l'ensemble des cartes.

Les joueurs votent alors secrètement pour la carte qu'ils pensent être celle du conteur. Mais son rôle est ardu. Il doit à la fois mettre les joueurs sur la voie, sans pour autant que la carte choisie saute aux yeux de tous.

Votre imagination parviendra-t-elle à toucher la sensibilité des gens vous entourant?")
dixit_game.photo.attach(io: photo_dixit, filename: "dixit.jpg", content_type: "image/jpg")
dixit_game.save

citadelles_game = Game.new( name: 'Citadelles',
number_of_players_min: 1,
number_of_players_max: 12,
category: 'Music',
price: 3.99,
user: jennifer,
description: "Dans Citadelles, votre but est de bâtir une cité prestigieuse avant que vos adversaires ne parviennent à construire la leur. Pour développer votre ville et de nouveaux quartiers, il vous faudra bien sûr de l’or, mais aussi le soutien des notables locaux, roi, échevin, cardinal, patricien ou archiviste, et parfois aussi de la lie de la cité, voleur, espion, assassin ou sorcière.

Citadelles est un jeu de bluff, d’intrigues et de stratégie. Les joueurs amassent de l’or qu’ils dépensent ensuite pour bâtir les quartiers qui composent leur cité médiévale. À la fin de la partie, le joueur qui a constitué la plus belle, la plus grande, la plus prestigieuse cité est vainqueur.
Citadelles est un jeu de stratégie qui se déroule dans un monde médiéval fantastique. Vous devez construire la plus grande et la plus belle ville du monde, avec différentes cartes qui représentent les quartiers: Université, Château, Cathédrale etc.

Pour réaliser cela, vous serez tour à tour l'un des plus puissants personnages de la ville, le Roi, l'Evèques, le Marchand etc. Mais il n'est pas facile de construire une Citadelles prospère et unique: cela nécessite richesses, ambition et filouterie.

Les parties sont toutes différentes et il vous faudra user de tactique et de ruse pour parvenir au succès en évitant le coups tordus des autres joueurs (vol, assassinat).

Chaque joueur développe une cité pour la rendre la plus riche et la plus prestigieuse. Vous construisez des quartiers à l'aide de cartes que vous exposez devant vous.
A chaque tour, les joueurs doivent incarner un personnage doté d'un pouvoir particulier : construire plus vite, détruire un quartier, assassiner, voler, remplir son trésor, protéger sa cité, piocher plus de cartes .

Pourrez-vous deviner quels sont les personnages choisis par les autres joueurs ? Serez-vous victime de l'assassin ou du voleur ? A moins que vous ne soyez vous-même l'assassin ou le voleur!

Rebondissements, coups tordus et ruses sont les points forts de Citadelles. Les règles sont simples et accessibles et on se plonge volontiers dans l'ambiance médiévale parfaitement illustrée sur des cartes de grande qualité.

Cette 4ème édition du célèbre jeu Citadelles contient les personnages et les quartiers du jeu originel et de son extension, La Cité Sombre, ainsi que 9 nouveaux personnages et 12 quartiers inédits, offrant plus de variété que jamais !")
citadelles_game.photo.attach(io: photo_citadelles, filename: "citadelles.jpg", content_type: "image/jpg")
citadelles_game.save

smallworld_game = Game.new( name: 'SmallWorld',
number_of_players_min: 3,
number_of_players_max: 8,
category: 'Science Fiction',
price: 4.10,
user: marion,
description: "Dans le jeu SmallWorld, les joueurs luttent pour conquérir les régions d'un monde où il n'y a pas de place pour tous ! En choisissant la bonne combinaison entre les 14 Peuples et les 20 Pouvoirs Spéciaux au bon moment, vous pourrez étendre votre empire, souvent aux dépens de vos voisins !

Il n'y a pas assez de place pour tous dans Small World ! Trop de Peuples vivent sur votre territoire - un territoire que vos ancêtres vous ont légué pour que vous bâtissiez un empire et dominiez le monde !
Choisissez une civilisation et étendez votre empire en déplaçant les tuiles représentant votre peuple pour conquérir les régions alentour et amasser des points de victoire. Votre empire finira par atteindre les limites de sa puissance et il vous faudra l'abandonner pour une autre civilisation. La clé de la victoire est de guetter le moment opportun pour faire décliner votre empire et en mener un autre à son apogée. Ce n'est qu'ainsi que vous régnerez sur le monde de Small World !

Grâce à son matériel irréprochable et ses illustrations de qualité, vous plongerez dans un monde où les peuples luttent sans merci en envoyant leurs troupes à la conquête de nouvelles régions : les civilisations les plus faibles seront impitoyablement chassées de ce monde trop étroit.

SmallWorld est un jeu de plateau et de conquête avec des règles simples mais une très grande profondeur stratégique.")
smallworld_game.photo.attach(io: photo_smallworld, filename: "smallworld.jpg", content_type: "image/jpg")
smallworld_game.save

cluedo_game = Game.new( name: 'Cluedo',
number_of_players_min: 2,
number_of_players_max: 8,
category: 'Murder/Mystery',
price: 5.50,
user: jennifer,
description: "Cluedo, c'est le jeu des grands détectives. Soyez le premier à démasquer l'assassin et à découvrir le lieu et l'arme du crime, par élimination et déduction.

Le célèbre milliardaire Samuel Lenoir a été assassiné... et c'est à vous de résoudre le mystère !
Élaborez vos propres hypothèses en posant des questions à vos adversaires. Qui l'a tué ? Dans quelle pièce ? Et avec quelle arme ? Pour mettre à rude épreuve son sens de la déduction, en toute convivialité.")
cluedo_game.photo.attach(io: photo_cluedo, filename: "cluedo.jpg", content_type: "image/jpg")
cluedo_game.save

mysterium_game = Game.create!( name: 'Mysterium',
number_of_players_min: 2,
number_of_players_max: 6,
category: 'Card Game',
price: 0.99,
user: marion,
description: "Dans les années 20, M. MacDowell, brillant astrologue clairvoyant pénètre dans sa nouvelle demeure lorsqu’il ressent immédiatement une présence surnaturelle. Il décide alors de rassembler les plus éminents médiums de son temps pour une séance de spiritisme exceptionnelle. Ils auront 7 heures pour entrer en contact avec le fantôme et résoudre un très ancien mystère…

Incapable de parler, le fantôme amnésique communiquera avec les médiums au travers de visions (cartes illustrées). Ils devront interpréter les images pour aider le fantôme à se remémorer les circonstances de sa mort (qui ? où ? quelle arme ?). Plus ils coopéreront et devineront juste, plus il sera facile de trouver le bon coupable.

Dans le jeu Mysterium, tout le monde perd ou tout le monde gagne car tous les joueurs sont unis pour découvrir la vérité sur la mort du fantôme qui hante la manoir et lui apporter la paix.

Ce jeu d’ambiance innovant, palpitant et immersif revisite les jeux d’enquête et de coopération avec une mécanique de jeu asymétrique. Chaque joueur choisit soit d'incarner un médium ou le fantôme avec des objectifs différents. Vous vous amuserez beaucoup à essayer de deviner ce que les autres joueurs ont dans leurs têtes !")
mysterium_game.photo.attach(io: photo_mysterium, filename: "mysterium.jpg", content_type: "image/jpg")
mysterium_game.save

unlock_game = Game.new( name: 'Unlock',
number_of_players_min: 2,
number_of_players_max: 6,
category: 'Science Fiction',
price: 1.25,
user: nicolas,
description: "Les escape rooms sont des salles dont vous devez vous échapper en moins de 60 minutes. Unlock! vous fait vivre ces expériences chez vous, autour d'une table.

Après avoir pris connaissance du contexte du scénario, vous commencez votre aventure dans une pièce (une carte de lieu qui indique divers numéros). Fouillez-la pour trouver des objets ! Attention : certains peuvent être cachés ! Des énigmes visuelles ou audio ralentissent votre progression... à vous de coopérer avec vos partenaires pour avancer et terminer dans les temps !

L'application gratuite Unlock!, compatible avec les téléphones et tablettes Android et iOS, est nécessaire pour jouer. Elle permet d'obtenir des indices, de repérer des objets cachés, mais aussi d'entrer les codes découverts. Elle contribue également à l'ambiance avec ses musiques dédiées à chaque aventure, ses énigmes audio, ses terribles pénalités et son compte à rebours fatal !

La boîte Unlock! contient trois aventures :
- La Formule : Entrez dans un laboratoire secret pour récupérer un mystérieux sérum élaboré par un scientifique.
- Squeek & Sausage : Déjouez les plans de l'infâme professeur Noside dans cette aventure cartoonesque.
- L'île du docteur Goorse : Visitez l'île d'un milliardaire excentrique collectionneur d'antiquités et triomphez de ses pièges.")
unlock_game.photo.attach(io: photo_unlock, filename: "unlock.jpg", content_type: "image/jpg")
unlock_game.save


puts "Games created !"

puts "Creating review !"

Review.create!(
  comment: "J'adore jouer à Catan, c'est un jeu fantastique!",
  rating: 5.0,
  user: nicolas,
  game: catan_game
)

Review.create!(
  comment: "Le jeu est niquel ! mais avec toutes les pièces dans la boite ça irait mieux....... Je recommande pas.",
  rating: 1.0,
  user: nicolas,
  game: catan_game
)

Review.create!(
  comment: "Uno c'est incroyable, encore plus quand tu le transformes en jeu d'apéro 🤣",
  rating: 5.0,
  user: jennifer,
  game: uno_game
)

Review.create!(
  comment: "C'est pas le meilleur jeu, mais ça se joue correctement, on se lasse assez vite",
  rating: 5.0,
  user: marion,
  game: vilainous_game
)
