require 'rspec'
require 'test'

describe "SQL" do

  describe "freyja" do 
    it "Find all the cats that are the same color as the cat named `Freyja`" do
      expect(freyja).to eq([["Abraham"], ["Adina"], ["Agripina"], ["Akilah"], ["Akilah"], ["Alec"], ["Alfonzo"], ["Alfredo"], ["Alpha"], ["Alphonso"], ["Alvera"], ["Andrea"], ["Andreas"], ["Andrew"], ["Angelique"], ["Angelyn"], ["Anibal"], ["Annika"], ["Antoine"], ["Antoinette"], ["Antonio"], ["April"], ["Armanda"], ["Artie"], ["Asa"], ["Augustus"], ["Austin"], ["Ava"], ["Beatriz"], ["Beau"], ["Belen"], ["Benedict"], ["Betty"], ["Bettye"], ["Bev"], ["Bill"], ["Bobbie"], ["Brandon"], ["Brent"], ["Britt"], ["Bryon"], ["Candi"], ["Carl"], ["Carly"], ["Carolyn"], ["Cassey"], ["Catherin"], ["Cecile"], ["Ceola"], ["Chang"], ["Chantel"], ["Charles"], ["Charles"], ["Charlie"], ["Chere"], ["Chester"], ["Chi"], ["Chi"], ["Christie"], ["Cierra"], ["Clyde"], ["Colby"], ["Coleman"], ["Connie"], ["Connie"], ["Cordell"], ["Coy"], ["Crissy"], ["Cristi"], ["Cyrstal"], ["Cyrus"], ["Dale"], ["Dalton"], ["Dalton"], ["Dana"], ["Daphne"], ["Darryl"], ["Darryl"], ["Dave"], ["Deandre"], ["Deangelo"], ["Delphia"], ["Demarcus"], ["Denisha"], ["Dennis"], ["Dominique"], ["Domonique"], ["Dong"], ["Donovan"], ["Dorian"], ["Dottie"], ["Dotty"], ["Douglas"], ["Dwight"], ["Dwight"], ["Edward"], ["Elden"], ["Eldridge"], ["Elia"], ["Elmira"], ["Elroy"], ["Elza"], ["Emanuel"], ["Ena"], ["Erika"], ["Ernie"], ["Ethan"], ["Eva"], ["Faustino"], ["Fausto"], ["Felicidad"], ["Felisa"], ["Ferne"], ["Fletcher"], ["Flor"], ["Gabriel"], ["Gale"], ["Gayle"], ["Gerry"], ["Gil"], ["Glenda"], ["Grady"], ["Gregorio"], ["Grisel"], ["Guadalupe"], ["Guy"], ["Hai"], ["Hailey"], ["Haywood"], ["Heriberto"], ["Hershel"], ["Hollis"], ["Houston"], ["Hue"], ["Ima"], ["Ione"], ["Irma"], ["Irving"], ["Isela"], ["Jacelyn"], ["Jackqueline"], ["Jamal"], ["James"], ["Jaqueline"], ["Jed"], ["Jeffie"], ["Jen"], ["Jenny"], ["Jeramy"], ["Jesica"], ["Jessia"], ["Jesus"], ["Jimmie"], ["Joana"], ["Joane"], ["John"], ["Johnsie"], ["Jonnie"], ["Josue"], ["Jude"], ["Jules"], ["Julieta"], ["Julietta"], ["Jung"], ["Kam"], ["Karan"], ["Karie"], ["Kasha"], ["Kellee"], ["Kelly"], ["Kelvin"], ["Ken"], ["Kent"], ["Kenton"], ["Kermit"], ["Kerry"], ["Khadijah"], ["Kirk"], ["Kitty"], ["Kristeen"], ["Kristopher"], ["Kum"], ["Lacie"], ["Landon"], ["Lane"], ["Lashanda"], ["Latarsha"], ["Laurinda"], ["Lavenia"], ["Lavern"], ["Lazaro"], ["Leighann"], ["Lenny"], ["Leo"], ["Lesley"], ["Lessie"], ["Li"], ["Lianne"], ["Lillie"], ["Lin"], ["Linsey"], ["Linwood"], ["Lissa"], ["Lizeth"], ["Loraine"], ["Lorina"], ["Lottie"], ["Lucretia"], ["Makeda"], ["Marcelene"], ["Marco"], ["Marcos"], ["Margaretta"], ["Marilu"], ["Marty"], ["Marx"], ["Mary"], ["Mathew"], ["Matt"], ["Maurine"], ["Maxima"], ["Megan"], ["Melodee"], ["Merrilee"], ["Mica"], ["Michael"], ["Michale"], ["Mirtha"], ["Mitchel"], ["Modesto"], ["Modesto"], ["Mohammed"], ["Monte"], ["Monty"], ["Mora"], ["Morton"], ["Murray"], ["Myesha"], ["Nada"], ["Naoma"], ["Nathan"], ["Neil"], ["Nelson"], ["Nettie"], ["Newton"], ["Nichole"], ["Noe"], ["Noel"], ["Normand"], ["Nubia"], ["Numbers"], ["Omer"], ["Oneida"], ["Orange"], ["Patrick"], ["Paula"], ["Pearlene"], ["Perla"], ["Pura"], ["Quentin"], ["Quinn"], ["Quintin"], ["Rachell"], ["Regenia"], ["Renaldo"], ["Renata"], ["Reynaldo"], ["Robert"], ["Rod"], ["Roger"], ["Romeo"], ["Ronnie"], ["Ronny"], ["Rosalba"], ["Rosana"], ["Roselyn"], ["Rosendo"], ["Ross"], ["Roxanne"], ["Rubye"], ["Rudolf"], ["Russell"], ["Rusty"], ["Sade"], ["Scarlet"], ["Sergio"], ["Shanae"], ["Shelton"], ["Sherwood"], ["Shin"], ["Shoshana"], ["Sigrid"], ["Simon"], ["Simonne"], ["Siu"], ["Sixta"], ["Stevie"], ["Sung"], ["Sunni"], ["Suzanne"], ["Suzette"], ["Sydney"], ["Ta"], ["Talitha"], ["Tanja"], ["Tanner"], ["Terrance"], ["Terresa"], ["Theodore"], ["Thu"], ["Tijuana"], ["Tomas"], ["Tonda"], ["Toney"], ["Tracey"], ["Tracy"], ["Tyler"], ["Ursula"], ["Usha"], ["Van"], ["Vanda"], ["Vannessa"], ["Vernon"], ["Veronique"], ["Vida"], ["Vincenzo"], ["Wallace"], ["Warren"], ["Weldon"], ["Wendell"], ["Wendell"], ["Wesley"], ["Wilford"], ["Willian"], ["Winfred"], ["Winston"], ["Yadira"], ["Yael"], ["Yong"], ["Yong"], ["Young"], ["Yung"], ["Yuriko"], ["Zachariah"], ["Zandra"], ["Zonia"]])
    end
  end

  describe "find_unknown" do
    it "finds all the toys that belong to the cat who's breed is `Unknown`" do
      expect(find_unknown).to eq([["Horn Drill"], ["Double Team"], ["Jump Kick"], ["Poison Powder"]])
    end
  end
  
  describe "five_cheap_toys" do
    it "finds the name and prices for the five cheapest toys" do
      expect(five_cheap_toys).to eq([["Shiny Mouse", "8"], ["Shiny Mouse", "7"], ["Shiny Mouse", "6"], ["Shiny Mouse", "5"], ["String", "1"]])
    end
  end

  describe "rich_crypto_cats" do 
    it "lists the names of the cats who acquired `Bitcoin Cash` at it's lowest price point" do
      expect(rich_crypto_cats).to eq([["Alexis"], ["Cornell"], ["Dovie"], ["Dulce"], ["Lucien"], ["Pattie"]])
    end
  end
  
  describe "toy_that_jet_owns" do
    it "shows the most expensive toy that Jets owns and shows all the cats who own that toy" do
      expect(toy_that_jet_owns).to eq([["Beatriz", "French Toast"], ["Bernetta", "French Toast"], ["Bret", "French Toast"], ["Chad", "French Toast"], ["Chana", "French Toast"], ["Christian", "French Toast"], ["Corrinne", "French Toast"], ["Coy", "French Toast"], ["Dominic", "French Toast"], ["Dorie", "French Toast"], ["Dudley", "French Toast"], ["Ellis", "French Toast"], ["Fumiko", "French Toast"], ["Georgiana", "French Toast"], ["Georgina", "French Toast"], ["Gerard", "French Toast"], ["Hal", "French Toast"], ["Harry", "French Toast"], ["Horace", "French Toast"], ["Ingeborg", "French Toast"], ["January", "French Toast"], ["Jasper", "French Toast"], ["Kim", "French Toast"], ["Leon", "French Toast"], ["Lianne", "French Toast"], ["Lieselotte", "French Toast"], ["Louisa", "French Toast"], ["Marquitta", "French Toast"], ["Nerissa", "French Toast"], ["Philip", "French Toast"], ["Ranae", "French Toast"], ["Ranae", "French Toast"], ["Renita", "French Toast"], ["Rickey", "French Toast"], ["Shavonda", "French Toast"], ["Simonne", "French Toast"], ["Tanika", "French Toast"], ["Taryn", "French Toast"], ["Therese", "French Toast"], ["Troy", "French Toast"], ["Von", "French Toast"], ["Walker", "French Toast"], ["Winifred", "French Toast"]])
    end
  end

end
