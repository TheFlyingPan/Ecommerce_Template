<?php

namespace App\Controller;

use App\Entity\UserTable;
use App\Entity\ProductList;

use App\Entity\ProductTable;
use App\Repository\UserTableRepository;
use Doctrine\ORM\EntityManagerInterface;
use App\Repository\ProductListRepository;
use App\Repository\ProductTableRepository;
use Symfony\Component\Serializer\Serializer;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Serializer\Encoder\XmlEncoder;
use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Symfony\Component\Serializer\Normalizer\NormalizerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Serializer\Exception\NotEncodableValueException;

class ApiArticleController extends AbstractController
{
    /**
     * @Route("/api/produit_index", name="api_produit_index", methods={"GET"})
     */
    public function indexProduits(ProductTableRepository $postRepository, SerializerInterface $serializer)
    {
        $posts = $postRepository->findAll();

        // $postsNormalise = $normalizer->normalize($posts);

        // dd($postsNormalise);

        // $json = json_encode($postsNormalise);

        // $json = $serializer->serialize($posts, 'json');
        // dd($json);
        // $response = new Response($json, 200, [
        //     "Content-type" => "application/json"
        // ]);

        // $response = new JsonResponse($json, 200, [], true);

        $response = $this->json($posts, 200, []);

        return $response;
    }

    /**
     * @Route("/api/produit_create", name="api_produit_create", methods={"POST"})
     */
    public function storeProduits(Request $request, SerializerInterface $serializer, EntityManagerInterface $em, ValidatorInterface $valid)
    {
        try {
            $jsonRecu = $request->getContent();

            $post = $serializer->deserialize($jsonRecu, ProductTable::class, 'json');

            $errors = $valid->validate($post);

            if (count($errors) > 0) {
                return $this->json($errors, 400);
            }

            $em->persist($post);
            $em->flush();
            
            return $this->json($post, 201, []);

        } catch(NotEncodableValueException $e) {

            return $this->json([
                'status' => 400,
                'message' => $e->getMessage()
            ], 400);
        };
    }


    /**
     * @Route("/api/user_index", name="api_user_index", methods={"GET"})
     */
    public function indexUsers(UserTableRepository $userRepository, SerializerInterface $serializer)
    {
        $users = $userRepository->findAll();
        $response = $this->json($users, 200, []);
        return $response;
    }

    
    /**
     * @Route("/api/user_create", name="api_user_create", methods={"POST"})
     */
    public function createUser(Request $request, SerializerInterface $serializer, EntityManagerInterface $em, ValidatorInterface $valid)
    {
        
        try {
            $jsonRecu = $request->getContent();

            $post = $serializer->deserialize($jsonRecu, UserTable::class, 'json');

            $errors = $valid->validate($post);

            if (count($errors) > 0) {
                return $this->json($errors, 400);
            }

            $em->persist($post);
            $em->flush();
            
            return $this->json($post, 201, []);

        } catch(NotEncodableValueException $e) {

            return $this->json([
                'status' => 400,
                'message' => $e->getMessage()
            ], 400);
        };
    }

    /**
     * @Route("/api/carte_mere", name="carte-mere", methods={"GET"})
     */
    public function getCatCM(ProductTableRepository $productRepository, SerializerInterface $serializer)
    {
        $users = $productRepository->findBy([
            'categorie' => 1
        ]);
        $response = $this->json($users, 200, []);
        return $response;
    }

    /**
     * @Route("/api/carte_graphique", name="carte-graphique", methods={"GET"})
     */
    public function getCatGPU(ProductTableRepository $productRepository, SerializerInterface $serializer)
    {
        $users = $productRepository->findBy([
            'categorie' => 2
        ]);
        $response = $this->json($users, 200, []);
        return $response;
    }
    
    /**
     * @Route("/api/cpu", name="cpu", methods={"GET"})
     */
    public function getCatCPU(ProductTableRepository $productRepository, SerializerInterface $serializer)
    {
        $users = $productRepository->findBy([
            'categorie' => 3
        ]);
        $response = $this->json($users, 200, []);
        return $response;
    }
    
    /**
     * @Route("/api/boitier", name="boitier", methods={"GET"})
     */
    public function getCatBoit(ProductTableRepository $productRepository, SerializerInterface $serializer)
    {
        $users = $productRepository->findBy([
            'categorie' => 4
        ]);
        $response = $this->json($users, 200, []);
        return $response;
    }

    
    /**
     * @Route("/api/ecran", name="ecran", methods={"GET"})
     */
    public function getCatEcran(ProductTableRepository $productRepository, SerializerInterface $serializer)
    {
        $users = $productRepository->findBy([
            'categorie' => 5
        ]);
        $response = $this->json($users, 200, []);
        return $response;
    }

    
    /**
     * @Route("/api/souris", name="souris", methods={"GET"})
     */
    public function getCatSouris(ProductTableRepository $productRepository, SerializerInterface $serializer)
    {
        $users = $productRepository->findBy([
            'categorie' => 6
        ]);
        $response = $this->json($users, 200, []);
        return $response;
    }

    
    /**
     * @Route("/api/clavier", name="clavier", methods={"GET"})
     */
    public function getCatClavier(ProductTableRepository $productRepository, SerializerInterface $serializer)
    {
        $users = $productRepository->findBy([
            'categorie' => 7
        ]);
        $response = $this->json($users, 200, []);
        return $response;
    }

    
    /**
     * @Route("/api/vent", name="vent", methods={"GET"})
     */
    public function getCatVent(ProductTableRepository $productRepository, SerializerInterface $serializer)
    {
        $users = $productRepository->findBy([
            'categorie' => 8
        ]);
        $response = $this->json($users, 200, []);
        return $response;
    }
    
    /**
     * @Route("/api/autre", name="autre", methods={"GET"})
     */
    public function getCatOther(ProductTableRepository $productRepository, SerializerInterface $serializer)
    {
        $users = $productRepository->findBy([
            'categorie' => 9
        ]);
        $response = $this->json($users, 200, []);
        return $response;
    }
    
    // /**
    //  * @Route("/api/produit_index/{id}", name="vent", methods={"GET"})
    //  */
    // public function getById(ProductTableRepository $productRepository, SerializerInterface $serializer)
    // {
    //     $users = $productRepository->findBy([
    //         'id' => {$id}
    //     ]);
    //     $response = $this->json($users, 200, []);
    //     return $response;
    // }
}
