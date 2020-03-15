<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use App\Entity\ProductList;

class ProductFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        for ($i = 1; $i <= 10; $i++) {
            $product = new ProductList();
            $product->setName("Intel core i5 n°$i")
                    ->setDescription("C'est un processeur vraiment symathique")
                    ->setInstock(TRUE)
                    ->setPhoto("http://placehold.it/500x300")
                    ->setPrice(269.99)
                    ->setCategory("CPU, Composant, Haut de Gamme");
            
            $manager->persist($product);
        }

        $manager->flush();
    }
}
