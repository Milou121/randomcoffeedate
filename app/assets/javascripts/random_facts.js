function GetValue()
{
    var myarray= new Array("Legend has it a 9th-century Ethiopian goat herder discovered coffee by accident when he noticed how crazy the beans were making his goats.","New Yorkers drink almost 7 times more coffee than other cities in the US.","Coffee is a psychoactive. And at high doses it can make you see things… It can also kill you…", "The lethal dose of caffeine is roughly 100 cups of coffee.", "A French doctor in the 1600s suggested Cafe Au Laits for patients, inspiring people to begin adding milk to coffee.", "Espresso is regulated by the Italian government because it is considered an essential part of their daily life.", "In the ancient Arab culture there was only one way a woman could legally divorce: If her husband didn’t provide enough coffee.", "Coffee beans are actually the pit of a berry, which makes them a fruit. The best fruit.", "IMPORTANT TO KNOW: Brewed espresso has 2.5% fat, while filtered coffee contains 0.6% fat.", "We’re not going to tell you how, but there is a way to brew coffee with marijuana in it and it is described as producing a “dreamy” kind of coffee buzz.", "Unlike the hip 20-something Baristas in the US, in Italy the average Barista age is 48, and it is a very respected profession.", "The first webcam was invented at The University of Cambridge to let people know if the coffee pot was full or not.", "There is a spa in Japan that lets you bathe in coffee, tea, or wine.", "This is the most expensive drink at Starbucks: $23.50, with 16 shots of espresso or 1400mg of caffeine.", "Irish coffee was actually invented to warm up cold American plane passengers leaving from Ireland.");
    var random = myarray[Math.floor(Math.random() * myarray.length)];
   document.getElementById("message").innerHTML=random;
}
