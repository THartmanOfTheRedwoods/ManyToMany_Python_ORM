from sqlalchemy import Column, Integer, String, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from datetime import datetime
# Import the shared Base object. It must be a single object to ensure
# relationships can be found
from .base import Base
from .association_tables import user_group_membership  # Import the association table

class UserGroup( Base ):
    __tablename__ = 'USER_GROUP'

    groupId = Column( Integer, primary_key=True, autoincrement=True )
    groupName = Column( String( 255 ), unique=True, nullable=False )
    createdBy = Column( Integer, ForeignKey( 'USER.userId' ) )
    createdAt = Column( DateTime, default=datetime.utcnow )

    # Many-to-many relationship with User
    users = relationship( 'User', secondary=user_group_membership, back_populates='groups' )

    def __repr__(self):
        return f"<UserGroup(id={self.groupId}, groupName='{self.groupName}', createdBy='{self.createdBy}')>"