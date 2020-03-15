<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use App\Entity\ProductList;
use App\Repository\ProductListRepository;

class ArticleController extends AbstractController
{
    /**
     * @Route("/article", name="article")
     */
    public function index(ProductListRepository $repo)
    {
        $articles = $repo->findAll();

        return $this->render('article/article.html.twig', [
            'controller_name' => 'ArticleController',
            'articles' => $articles
        ]);
    }
    
    /**
     * @Route("/", name="home")
     */
    public function home()
    {
        return $this->render('article/home.html.twig', [
            'controller_name' => 'homeController',
        ]);
    }
    
    /**
     * @Route("/article/new", name="article_create")
     */
    public function create(Request $request, ObjectManager $manager) {
        $article = new ProductList();

        $form = $this->createFormBuilder($article)
                    ->add('name', TextType::class, [
                        'attr' => [
                            'placeholder' => "Nom du produit",
                            'class' => "form-control"
                        ]
                    ])
                    ->add('description', TextareaType::class, [
                        'attr' => [
                            'placeholder' => "Description du produit",
                            'class' => "form-control"
                        ]
                    ])
                    ->add('price', TextType::class, [
                        'attr' => [
                            'placeholder' => "Prix du produit",
                            'class' => "form-control"
                        ]
                    ])
                    ->add('photo', TextType::class, [
                        'attr' => [
                            'placeholder' => "Photo du produit",
                            'class' => "form-control"
                        ]
                    ])
                    ->add('instock', CheckboxType::class, [
                        'attr' => [
                            'class' => "form-control"
                        ]
                    ])
                    ->add('category', TextType::class, [
                        'attr' => [
                            'placeholder' => "Catégorie(s) du produit",
                            'class' => "form-control"
                        ]
                    ])
                    ->getForm();
        
        // $form->handleRequest($request);

        // if($form->isSubmitted() && $form->isValid()) {
        //     $manager->persist($article);
        //     $manager-> flush();
        //     return $this->redirectToRoute('article_show', ['id' => $article->getId
        //     ()]);
        // }

        return $this->render('article/create.html.twig', [
            'formProduit' => $form->createView()
        ]);
    }

    /**
     * @Route("/article/{id}", name="article_show")
     */
    public function show(ProductList $article)
    {
        // $repo = $this->getDoctrine()->getRepository(ProductList::class);

        // $article = $repo->find($id);

        return $this->render('article/show.html.twig', [
            'article' => $article,
        ]);
    }
    
}
