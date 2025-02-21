from sqlalchemy import Column, Integer, String, DateTime
from sqlalchemy.orm import relationship
from datetime import datetime
# Import the shared Base object. It must be a single object to ensure
# relationships can be found
from .base import Base
from .association_tables import user_group_membership  # Import the association table

class User( Base ):
    __tablename__ = 'USER'

    userId = Column( Integer, primary_key=True, autoincrement=True )
    username = Column( String( 255 ), unique=True, nullable=False )
    email = Column( String( 255 ), unique=True, nullable=False )
    passwordHash = Column( String( 255 ), nullable=False )
    createdAt = Column( DateTime, default=datetime.utcnow )

    # Many-to-many relationship with UserGroup
    groups = relationship( 'UserGroup', secondary=user_group_membership, back_populates='users' )

    def __repr__(self):
        return f"<User(id={self.userId}, username='{self.username}', email='{self.email}')>"

