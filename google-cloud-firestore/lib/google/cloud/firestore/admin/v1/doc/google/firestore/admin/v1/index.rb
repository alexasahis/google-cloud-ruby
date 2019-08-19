# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


module Google
  module Firestore
    module Admin
      module V1
        # Cloud Firestore indexes enable simple and complex queries against
        # documents in a database.
        # @!attribute [rw] name
        #   @return [String]
        #     Output only.
        #     A server defined name for this index.
        #     The form of this name for composite indexes will be:
        #     `projects/{project_id}/databases/{database_id}/collectionGroups/{collection_id}/indexes/{composite_index_id}`
        #     For single field indexes, this field will be empty.
        # @!attribute [rw] query_scope
        #   @return [Google::Firestore::Admin::V1::Index::QueryScope]
        #     Indexes with a collection query scope specified allow queries
        #     against a collection that is the child of a specific document, specified at
        #     query time, and that has the same collection id.
        #
        #     Indexes with a collection group query scope specified allow queries against
        #     all collections descended from a specific document, specified at query
        #     time, and that have the same collection id as this index.
        # @!attribute [rw] fields
        #   @return [Array<Google::Firestore::Admin::V1::Index::IndexField>]
        #     The fields supported by this index.
        #
        #     For composite indexes, this is always 2 or more fields.
        #     The last field entry is always for the field path `__name__`. If, on
        #     creation, `__name__` was not specified as the last field, it will be added
        #     automatically with the same direction as that of the last field defined. If
        #     the final field in a composite index is not directional, the `__name__`
        #     will be ordered ASCENDING (unless explicitly specified).
        #
        #     For single field indexes, this will always be exactly one entry with a
        #     field path equal to the field path of the associated field.
        # @!attribute [rw] state
        #   @return [Google::Firestore::Admin::V1::Index::State]
        #     Output only.
        #     The serving state of the index.
        class Index
          # A field in an index.
          # The field_path describes which field is indexed, the value_mode describes
          # how the field value is indexed.
          # @!attribute [rw] field_path
          #   @return [String]
          #     Can be __name__.
          #     For single field indexes, this must match the name of the field or may
          #     be omitted.
          # @!attribute [rw] order
          #   @return [Google::Firestore::Admin::V1::Index::IndexField::Order]
          #     Indicates that this field supports ordering by the specified order or
          #     comparing using =, <, <=, >, >=.
          # @!attribute [rw] array_config
          #   @return [Google::Firestore::Admin::V1::Index::IndexField::ArrayConfig]
          #     Indicates that this field supports operations on `array_value`s.
          class IndexField
            # The supported array value configurations.
            module ArrayConfig
              # The index does not support additional array queries.
              ARRAY_CONFIG_UNSPECIFIED = 0

              # The index supports array containment queries.
              CONTAINS = 1
            end

            # The supported orderings.
            module Order
              # The ordering is unspecified. Not a valid option.
              ORDER_UNSPECIFIED = 0

              # The field is ordered by ascending field value.
              ASCENDING = 1

              # The field is ordered by descending field value.
              DESCENDING = 2
            end
          end

          # Query Scope defines the scope at which a query is run. This is specified on
          # a StructuredQuery's `from` field.
          module QueryScope
            # The query scope is unspecified. Not a valid option.
            QUERY_SCOPE_UNSPECIFIED = 0

            # Indexes with a collection query scope specified allow queries
            # against a collection that is the child of a specific document, specified
            # at query time, and that has the collection id specified by the index.
            COLLECTION = 1
          end

          # The state of an index. During index creation, an index will be in the
          # `CREATING` state. If the index is created successfully, it will transition
          # to the `READY` state. If the index creation encounters a problem, the index
          # will transition to the `NEEDS_REPAIR` state.
          module State
            # The state is unspecified.
            STATE_UNSPECIFIED = 0

            # The index is being created.
            # There is an active long-running operation for the index.
            # The index is updated when writing a document.
            # Some index data may exist.
            CREATING = 1

            # The index is ready to be used.
            # The index is updated when writing a document.
            # The index is fully populated from all stored documents it applies to.
            READY = 2

            # The index was being created, but something went wrong.
            # There is no active long-running operation for the index,
            # and the most recently finished long-running operation failed.
            # The index is not updated when writing a document.
            # Some index data may exist.
            # Use the google.longrunning.Operations API to determine why the operation
            # that last attempted to create this index failed, then re-create the
            # index.
            NEEDS_REPAIR = 3
          end
        end
      end
    end
  end
end