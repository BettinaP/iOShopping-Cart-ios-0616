//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Bettina on 6/9/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"


@implementation FISShoppingCart




-(NSUInteger)calculateTotalPriceInCents{
    
    NSUInteger priceInCents = 0;
    
    for(FISItem *item in self.items){
      priceInCents = priceInCents + item.priceInCents;
    }
    return priceInCents;
}


-(void)addItem:(FISItem *)item{
    [self.items addObject:item];
}



-(void)removeItem:(FISItem *)item{
    
    NSUInteger index = [self.items indexOfObject:item];
    [self.items removeObjectAtIndex:index];
}


-(void)removeAllItemsLikeItem:(FISItem *)item{
    [self.items removeObject:item];
}

-(void)sortItemsByNameAsc{
    
    NSSortDescriptor *nameSorterAsc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [self.items sortUsingDescriptors:@[nameSorterAsc]];
}

-(void)sortItemsByNameDesc{
    
    NSSortDescriptor *nameSorterDesc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    [self.items sortUsingDescriptors:@[nameSorterDesc]];
}

-(void)sortItemsByPriceInCentsAsc{
    
    NSSortDescriptor *priceSorterAsc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:YES];
    [self.items sortUsingDescriptors:@[priceSorterAsc]];
}

-(void)sortItemsByPriceInCentsDesc{
    
    NSSortDescriptor *priceSorterDesc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:NO];
    [self.items sortUsingDescriptors:@[priceSorterDesc]];

}

-(NSArray *)allItemsWithName:(NSString *)name{
    
    NSMutableArray *matchingNames = [[NSMutableArray alloc]init];
 
    for(FISItem *item in self.items){
        if([item.name isEqualToString:name]){
            [matchingNames addObject:item];
        }
    }
    return matchingNames;
    
}

-(NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)price{
   
    
    NSPredicate *minimumPredicate =[NSPredicate predicateWithFormat:@"priceInCents >= %lu",price];
    NSArray *minimumPricedItems = [self.items filteredArrayUsingPredicate:minimumPredicate];
    NSLog(@"\n\n\n\n\n\n\n\n\n %@", minimumPricedItems);
    
    return minimumPricedItems;
    
}

-(NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)price{
    NSPredicate *maximumPredicate =[NSPredicate predicateWithFormat:@"priceInCents <= %lu",price];
    NSArray *maximumPricedItems = [self.items filteredArrayUsingPredicate:maximumPredicate];
    NSLog(@"\n\n\n\n\n\n\n\n\n %@", maximumPricedItems);
    
    return maximumPricedItems;
    
}

@end
