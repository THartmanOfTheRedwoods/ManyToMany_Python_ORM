from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from models.base import Base  # Import the shared Base object
from models.user_group import UserGroup  # Import the models
from models.user import User # Import the user model

def find_users_in_group(group_name):
    group = session.query(UserGroup).filter_by(groupName=group_name).first()
    if group:
        return group.users
    return []

def find_groups_for_user(username):
    user = session.query(User).filter_by(username=username).first()
    if user:
        return user.groups
    return []

if __name__ == '__main__':
    # Create a Database Engine
    echo=False  # Change to True if you want to see ORM Sql Like output.
    engine = create_engine('mysql+mysqlconnector://root:PASSWORD@localhost:3306/PasswordManager', echo=echo)

    # Create all tables if they don't exist
    Base.metadata.create_all(engine)

    # Create a session
    Session = sessionmaker( bind=engine )
    session = Session()

    search_group = 'Viewers'
    users_in_group = find_users_in_group(search_group)
    print(f"The users in group {search_group} are: {', '.join([str(user) for user in users_in_group])}")
    # for u in users_in_group:
    #    print( u.username )

    search_user = 'bob'
    groups_for_user = find_groups_for_user( 'bob' )
    print(f"The groups user {search_user} is in are: {', '.join([str(group) for group in groups_for_user])}")
    # for g in groups_for_user:
    #    print( g.groupName )
