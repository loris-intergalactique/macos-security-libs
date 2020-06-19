// This file was automatically generated by protocompiler
// DO NOT EDIT!
// Compiled from C2Metric.proto

#import <Foundation/Foundation.h>
#import <ProtocolBuffer/PBCodable.h>

@class SECC2MPCloudKitOperationGroupInfo;
@class SECC2MPCloudKitOperationInfo;

#ifdef __cplusplus
#define SECC2MPCLOUDKITINFO_FUNCTION extern "C" __attribute__((visibility("hidden")))
#else
#define SECC2MPCLOUDKITINFO_FUNCTION extern __attribute__((visibility("hidden")))
#endif

__attribute__((visibility("hidden")))
@interface SECC2MPCloudKitInfo : PBCodable <NSCopying>
{
    uint64_t _reportClientOperationFrequency;
    uint64_t _reportClientOperationFrequencyBase;
    uint64_t _reportOperationGroupFrequency;
    uint64_t _reportOperationGroupFrequencyBase;
    NSString *_clientBundleId;
    NSMutableArray<SECC2MPCloudKitOperationInfo *> *_clientOperations;
    NSString *_clientProcessVersion;
    NSString *_container;
    NSString *_environment;
    NSMutableArray<SECC2MPCloudKitOperationGroupInfo *> *_operationGroups;
    BOOL _anonymous;
    struct {
        int reportClientOperationFrequency:1;
        int reportClientOperationFrequencyBase:1;
        int reportOperationGroupFrequency:1;
        int reportOperationGroupFrequencyBase:1;
        int anonymous:1;
    } _has;
}


@property (nonatomic, readonly) BOOL hasClientProcessVersion;
@property (nonatomic, retain) NSString *clientProcessVersion;

@property (nonatomic, readonly) BOOL hasClientBundleId;
@property (nonatomic, retain) NSString *clientBundleId;

@property (nonatomic, readonly) BOOL hasContainer;
@property (nonatomic, retain) NSString *container;

@property (nonatomic, readonly) BOOL hasEnvironment;
@property (nonatomic, retain) NSString *environment;

@property (nonatomic) BOOL hasAnonymous;
@property (nonatomic) BOOL anonymous;

@property (nonatomic, retain) NSMutableArray<SECC2MPCloudKitOperationGroupInfo *> *operationGroups;
- (void)clearOperationGroups;
- (void)addOperationGroup:(SECC2MPCloudKitOperationGroupInfo *)i;
- (NSUInteger)operationGroupsCount;
- (SECC2MPCloudKitOperationGroupInfo *)operationGroupAtIndex:(NSUInteger)idx;
+ (Class)operationGroupType;

@property (nonatomic) BOOL hasReportOperationGroupFrequency;
@property (nonatomic) uint64_t reportOperationGroupFrequency;

@property (nonatomic) BOOL hasReportOperationGroupFrequencyBase;
@property (nonatomic) uint64_t reportOperationGroupFrequencyBase;

@property (nonatomic, retain) NSMutableArray<SECC2MPCloudKitOperationInfo *> *clientOperations;
- (void)clearClientOperations;
- (void)addClientOperation:(SECC2MPCloudKitOperationInfo *)i;
- (NSUInteger)clientOperationsCount;
- (SECC2MPCloudKitOperationInfo *)clientOperationAtIndex:(NSUInteger)idx;
+ (Class)clientOperationType;

@property (nonatomic) BOOL hasReportClientOperationFrequency;
@property (nonatomic) uint64_t reportClientOperationFrequency;

@property (nonatomic) BOOL hasReportClientOperationFrequencyBase;
@property (nonatomic) uint64_t reportClientOperationFrequencyBase;

// Performs a shallow copy into other
- (void)copyTo:(SECC2MPCloudKitInfo *)other;

// Performs a deep merge from other into self
// If set in other, singular values in self are replaced in self
// Singular composite values are recursively merged
// Repeated values from other are appended to repeated values in self
- (void)mergeFrom:(SECC2MPCloudKitInfo *)other;

SECC2MPCLOUDKITINFO_FUNCTION BOOL SECC2MPCloudKitInfoReadFrom(__unsafe_unretained SECC2MPCloudKitInfo *self, __unsafe_unretained PBDataReader *reader);

@end

