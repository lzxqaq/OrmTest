#ifndef USER_H
#define USER_H

class USER_DLL_EXPORT User
{
public:
    User() : id(0) { }
    virtual ~User() { }

    long id;
    QString name;
    int age;
};

QX_REGISTER_HPP_USER(User, qx::trait::no_base_class_defined, 1)

#endif // USER_H
