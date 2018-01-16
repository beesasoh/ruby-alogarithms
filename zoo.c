#include <iostream>
#include <list>
using namespace std;

class CareTaker
{
    private:
    public:
       virtual void PrintDetails() = 0;
};

class IndividualCareTaker : public CareTaker
{
    string sCareTakerName_;
    int iAge_;
    public:
        void PrintDetails();
};

class GroupCareTaker
{
    list<IndividualCareTaker*> lCareTakers_;
    public:
        void PrintDetails()
        {
        }
};

enum ECageType
{
    CAGE_METAL,
    CAGE_WOOD
};

class Cage
{
    private:
        ECageType eType_;
};

class FlyingType
{
    public:
        virtual void Fly() = 0;
};

class CanFly : public FlyingType
{
    public:
        void Fly()
        {
            cout << "Can Fly" << endl;
        }
};

class CannotFly : public FlyingType
{
    public:
        void Fly()
        {
            cout << "Can not Fly" << endl;
        }
};

class Animal
{
    private:
        Cage* pCageForAnimal_;
        CareTaker* pAnimalCareTaker_;
        string sAnimalName_;
    public:
        const Cage* GetItsCage();
        const CareTaker* GetItsCareTaker();
        const string& GetItsName();
        virtual void PrintItsDetails() = 0;
};

class Birds : public Animal
{
    private:
        FlyingType* pItsFlyingType;
    public:
        bool SetFlyingType(FlyingType* flyingType);
        void PrintItsDetails();

};

class Mammals : public Animal
{
    private:
        int iNumberOfLegs_;
        bool bDangerous_;
    public:
        void PrintItsDetails();
};

class Zoo
{
    private:
        list<Animal*> lAnimalList_;
    public:
        void DisplayAllAnimals();
        void GetCountOfAnimals();
};