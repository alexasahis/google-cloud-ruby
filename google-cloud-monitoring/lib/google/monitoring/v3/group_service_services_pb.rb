# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/monitoring/v3/group_service.proto for package 'google.monitoring.v3'
# Original file comments:
# Copyright 2016 Google Inc.
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
#

require 'grpc'
require 'google/monitoring/v3/group_service_pb'

module Google
  module Monitoring
    module V3
      module GroupService
        # The Group API lets you inspect and manage your
        # [groups](google.monitoring.v3.Group).
        #
        # A group is a named filter that is used to identify
        # a collection of monitored resources. Groups are typically used to
        # mirror the physical and/or logical topology of the environment.
        # Because group membership is computed dynamically, monitored
        # resources that are started in the future are automatically placed
        # in matching groups. By using a group to name monitored resources in,
        # for example, an alert policy, the target of that alert policy is
        # updated automatically as monitored resources are added and removed
        # from the infrastructure.
        class Service

          include GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'google.monitoring.v3.GroupService'

          # Lists the existing groups.
          rpc :ListGroups, ListGroupsRequest, ListGroupsResponse
          # Gets a single group.
          rpc :GetGroup, GetGroupRequest, Group
          # Creates a new group.
          rpc :CreateGroup, CreateGroupRequest, Group
          # Updates an existing group.
          # You can change any group attributes except `name`.
          rpc :UpdateGroup, UpdateGroupRequest, Group
          # Deletes an existing group.
          rpc :DeleteGroup, DeleteGroupRequest, Google::Protobuf::Empty
          # Lists the monitored resources that are members of a group.
          rpc :ListGroupMembers, ListGroupMembersRequest, ListGroupMembersResponse
        end

        Stub = Service.rpc_stub_class
      end
    end
  end
end
