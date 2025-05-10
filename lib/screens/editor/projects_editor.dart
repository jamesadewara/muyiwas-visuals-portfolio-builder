import 'package:flutter/material.dart';
import 'package:muyiwas_visuals_portfolio_builder/models/portfolio_model.dart';
import 'package:muyiwas_visuals_portfolio_builder/providers/portfolio_provider.dart';
import 'package:muyiwas_visuals_portfolio_builder/widgets/common/custom_text_field.dart';
import 'package:provider/provider.dart';

class ProjectsEditorScreen extends StatefulWidget {
  final PortfolioModel portfolio;
  const ProjectsEditorScreen({super.key, required this.portfolio});

  @override
  State<ProjectsEditorScreen> createState() => _ProjectsEditorScreenState();
}

class _ProjectsEditorScreenState extends State<ProjectsEditorScreen> {
  late PortfolioModel _portfolio;
//   final _titleController = TextEditingController();
//   final _descriptionController = TextEditingController();
//   final _tagsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _portfolio = widget.portfolio;
  }

  void _addProject() {
    setState(() {
      _portfolio = _portfolio.copyWith(
        projects: [
          ..._portfolio.projects,
          Project(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            title: 'New Project',
            description: 'Project description',
            tags: [], image: '', link: '',
          ),
        ],
      );
    });
  }

  void _removeProject(Project project) {
    setState(() {
      _portfolio = _portfolio.copyWith(
        projects: _portfolio.projects.where((p) => p.id != project.id).toList(),
      );
    });
  }

  void _updatePortfolio() {
    Provider.of<PortfolioProvider>(context, listen: false)
        .updatePortfolio(_portfolio.copyWith(
      updatedAt: DateTime.now(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Projects'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              _updatePortfolio();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProject,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _portfolio.projects.length,
        itemBuilder: (context, index) {
          final project = _portfolio.projects[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          initialValue: project.title,
                          labelText: 'Project Title',
                          onChanged: (value) {
                            setState(() {
                              _portfolio = _portfolio.copyWith(
                                projects: _portfolio.projects.map((p) {
                                  return p.id == project.id 
                                      ? p.copyWith(title: value)
                                      : p;
                                }).toList(),
                              );
                            });
                          },
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeProject(project),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                 Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                        image: project.image != null
                            ? DecorationImage(
                                image: NetworkImage(project.image),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: project.image == null
                          ? const Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.add_photo_alternate, size: 48),
                                  Text('Add Project Image'),
                                ],
                              ),
                            )
                          : null,
                    ),
                
                  const SizedBox(height: 16),
                  CustomTextField(
                    initialValue: project.description,
                    labelText: 'Description',
                    maxLines: 3,
                    onChanged: (value) {
                      setState(() {
                        _portfolio = _portfolio.copyWith(
                          projects: _portfolio.projects.map((p) {
                            return p.id == project.id 
                                ? p.copyWith(description: value)
                                : p;
                          }).toList(),
                        );
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    initialValue: project.tags.join(', '),
                    labelText: 'Tags (comma separated)',
                    onChanged: (value) {
                      setState(() {
                        _portfolio = _portfolio.copyWith(
                          projects: _portfolio.projects.map((p) {
                            return p.id == project.id 
                                ? p.copyWith(tags: value.split(',').map((e) => e.trim()).toList())
                                : p;
                          }).toList(),
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}