//
//  EditProfileView.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 08/06/26.
//

import SwiftUI

struct EditProfileView: View {

    // MARK: - Field Focus
    private enum Field {
        case name
        case email
    }

    // MARK: - Dependencies
    @Bindable var viewModel: ProfileViewModel
    @Environment(\.dismiss) private var dismiss

    // MARK: - Local State
    @State private var name: String
    @State private var email: String
    @FocusState private var focusedField: Field?

    // MARK: - Init
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        _name = State(initialValue: viewModel.name)
        _email = State(initialValue: viewModel.email)
    }

    // MARK: - Body
    var body: some View {
        NavigationStack {
            Form {
                Section("Personal Information") {
                    TextField("Name", text: $name)
                        .textContentType(.name)
                        .focused($focusedField, equals: .name)
                        .submitLabel(.next)
                        .onSubmit { focusedField = .email }
                        .accessibilityIdentifier("editProfile.nameField")

                    TextField("Email", text: $email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .focused($focusedField, equals: .email)
                        .submitLabel(.done)
                        .onSubmit { focusedField = nil }
                        .accessibilityIdentifier("editProfile.emailField")
                }
            }
            .scrollDismissesKeyboard(.interactively)
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                        .accessibilityIdentifier("editProfile.cancel")
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") { save() }
                        .disabled(name.trimmingCharacters(in: .whitespaces).isEmpty)
                        .accessibilityIdentifier("editProfile.save")
                }
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") { focusedField = nil }
                        .accessibilityIdentifier("editProfile.keyboardDone")
                }
            }
        }
    }

    // MARK: - Actions
    private func save() {
        viewModel.updateProfile(name: name, email: email)
        dismiss()
    }
}

#Preview {
    EditProfileView(viewModel: ProfileViewModel())
}
