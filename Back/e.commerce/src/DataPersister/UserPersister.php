<?php 

namespace App\DataPersister;

use App\Entity\UserTable;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use ApiPlatform\Core\DataPersister\DataPersisterInterface;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class UserPersister implements DataPersisterInterface 
{
    public function __construct(EntityManagerInterface $em, UserPasswordEncoderInterface $encoder)
    {
        $this->em = $em;
        $this->encoder = $encoder;
    }

    public function supports($data): bool
    {
        return $data instanceof UserTable;
    }

    public function persist($data) 
    {
        // UserPasswordEncoderInterface $encoder;
        $user = $data->getUsername();
        $pass = $data->getPassword();

        $usern = new UserTable();
        $usern->setUsername($user);

        $encoded = $this->encoder->encodePassword($usern, $pass);
        $data->setPassword($encoded);

        $this->em->persist($data);
        $this->em->flush();
    }

    public function remove($data)
    {
        $this->em->persist($data);
        $this->em->flush();
    }
}